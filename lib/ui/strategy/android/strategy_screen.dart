import 'package:clash_fudge/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StrategyScreen extends StatefulHookConsumerWidget {
  const StrategyScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StrategyScreenState();
}

class _StrategyScreenState extends ConsumerState<StrategyScreen> {
  final menuController = MenuController();
  @override
  Widget build(BuildContext context) {
    final profiles = ref.watch(clashProfileSubscriberProvider);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme.apply(displayColor: Theme.of(context).colorScheme.onSurface);
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
            : CustomScrollView(
                slivers: [
                  SliverGrid.extent(maxCrossAxisExtent: 300, mainAxisSpacing: 12, crossAxisSpacing: 12, children: [
                    for (var profile in profiles)
                      GestureDetector(
                        // onTap: () {
                        //   ref.read(clashProfileSubscriberProvider.notifier).selectProfile(profile);
                        // },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: colorScheme.surfaceVariant.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                profile.name,
                                style: textTheme.titleLarge,
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                profile.name,
                                style: textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      )
                  ])
                ],
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
      // ? Center(
      //     child: Padding(
      //     padding: const EdgeInsets.only(bottom: 24),
      //     child: Text(
      //       "没有有效的配置文件",
      //       style: textTheme.titleLarge,
      //     ),
      //   ))
      // : const CustomScrollView(
      //     slivers: [],
      //   ),
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
            onPressed: () => {},
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
