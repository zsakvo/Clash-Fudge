import 'package:clash_fudge/android_app_provider.dart';
import 'package:clash_fudge/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfileScreen extends StatefulHookConsumerWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final menuController = MenuController();
  @override
  Widget build(BuildContext context) {
    final profiles = ref.watch(clashProfileSubscriberProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme.apply(displayColor: Theme.of(context).colorScheme.onSurface);
    final currentProfileName = ref.watch(androidAppConfigProvider.select((value) => value.value?.currentProfile));
    return Scaffold(
      backgroundColor: colorScheme.surfaceVariant.withOpacity(0.2),
      body: profiles.when(data: (profiles) {
        return profiles.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Text(
                    "没有有效的配置文件",
                    style: textTheme.titleLarge,
                  ),
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  final profile = profiles[index];
                  return RadioListTile.adaptive(
                    contentPadding: const EdgeInsets.only(left: 16, right: 0, top: 8, bottom: 8),
                    title: Text(
                      profile.name,
                      style: const TextStyle(fontSize: 18),
                    ),
                    value: profile.name,
                    groupValue: currentProfileName,
                    secondary: IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
                    onChanged: (value) {
                      ref.read(androidAppConfigProvider.notifier).setCurrentProfile(name: profile.name);
                    },
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            profile.url == null ? "本地配置" : "远程配置",
                            style: textTheme.bodyMedium,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, bottom: 4),
                          child: Text(
                            "共${profile.proxiesNum}个节点",
                            style: textTheme.bodyMedium,
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: profiles.length,
              );
      }, error: (error, stackTrace) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 24),
            child: Text(
              "没有有效的配置文件",
              style: textTheme.titleLarge,
            ),
          ),
        );
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
      floatingActionButton: MenuAnchor(
        controller: menuController,
        alignmentOffset: const Offset(-194, -180),
        style: MenuStyle(
          elevation: MaterialStateProperty.all(3),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
        ),
        menuChildren: [
          MenuItemButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(250, 0)),
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 18, horizontal: 12)),
            ),
            leadingIcon: const Icon(Icons.file_open),
            child: const Text("导入文件"),
            onPressed: () => ref.read(clashProfileSubscriberProvider.notifier).importFormFile(),
          ),
          MenuItemButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(250, 0)),
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 18, horizontal: 12)),
            ),
            leadingIcon: const Icon(Icons.link),
            child: const Text("导入 URL"),
            onPressed: () => {},
          ),
          MenuItemButton(
            leadingIcon: const Icon(
              Icons.qr_code,
              // size: 20,
            ),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(250, 0)),
              padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 18, horizontal: 12)),
              backgroundColor: MaterialStateProperty.all(colorScheme.primary),
              foregroundColor: MaterialStateProperty.all(colorScheme.onPrimary),
              iconColor: MaterialStateProperty.all(colorScheme.onPrimary),
            ),
            onPressed: () {
              context.push("/scan").then((value) {
                if (value.toString().startsWith("http")) {
                  showDialog(
                    useRootNavigator: false,
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("订阅链接"),
                        content: Text(value.toString()),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // ref.read(clashProfileSubscriberProvider.notifier).addProfile(url: value.toString());
                              context.pop();
                            },
                            child: const Text("添加"),
                          ),
                          TextButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: const Text("取消"),
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  // toast 提示非法
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("不是有效的订阅链接")));
                }
              });
            },
            child: const Text(
              "扫描二维码",
            ),
          ),
        ],
        builder: (context, controller, child) {
          return FloatingActionButton(
            onPressed: () {
              if (controller.isOpen) {
                controller.close();
              } else {
                controller.open();
              }
            },
            elevation: 0,
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}
