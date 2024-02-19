import 'package:clash_fudge/providers/strategy_provider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme.apply(displayColor: Theme.of(context).colorScheme.onSurface);
    final strategey = ref.watch(strategeyProvider);
    final currentIndex = useState(0);
    final delayMap = ref.watch(proxyDelayProvider);
    final group = strategey.value!.$2[currentIndex.value];
    return DefaultTabController(
        length: strategey.value!.$2.length,
        child: Scaffold(
            backgroundColor: colorScheme.surfaceVariant.withOpacity(0.2),
            body: strategey.whenOrNull(
                  data: (data) {
                    return Column(
                      children: [
                        TabBar(
                            tabAlignment: TabAlignment.start,
                            isScrollable: true,
                            onTap: (value) => currentIndex.value = value,
                            tabs: data!.$2
                                .map((group) => Tab(
                                      child: Text(group.name),
                                    ))
                                .toList()),
                        Expanded(
                            child: GridView.count(
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                          crossAxisCount: 2,
                          childAspectRatio: 1.6,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          children: (group.all ?? [])
                              .mapIndexed((i, proxy) => GestureDetector(
                                  onTap: () {
                                    ref.read(strategeyProvider.notifier).setProxy(groupName: group.name, name: proxy);
                                  },
                                  child: Card(
                                      elevation: 0,
                                      margin: EdgeInsets.zero,
                                      color: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                                        // color
                                        side: BorderSide(color: colorScheme.secondaryContainer.withOpacity(0.8)),
                                      ),
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      proxy,
                                                      style:
                                                          textTheme.bodyMedium?.copyWith(color: colorScheme.secondary),
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                  if (proxy == group.now)
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 6),
                                                      child: Align(
                                                        alignment: Alignment.topRight,
                                                        child: Icon(
                                                          Icons.check_circle,
                                                          color: colorScheme.primary,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    )
                                                ],
                                              ),
                                              if (delayMap.value![proxy] != null)
                                                Align(
                                                    alignment: Alignment.bottomLeft,
                                                    child: getDelayText(delayMap.value![proxy]!, textTheme))
                                            ],
                                          )))))
                              .toList(),
                        ))
                      ],
                    );
                  },
                ) ??
                const SizedBox.shrink(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                delayMap.isLoading ? null : ref.read(proxyDelayProvider.notifier).testGroupProxy(group.name);
              },
              elevation: 0,
              child: delayMap.when(
                data: (data) {
                  return SvgPicture.asset("assets/icon/pulse.svg");
                },
                error: (error, stackTrace) {
                  return SvgPicture.asset("assets/icon/pulse.svg");
                },
                loading: () {
                  return const Padding(
                    padding: EdgeInsets.all(18),
                    child: CircularProgressIndicator(
                      strokeWidth: 2.4,
                    ),
                  );
                },
              ),
            )));
  }

  Text getDelayText(int delay, TextTheme textTheme) {
    if (delay < 0) {
      // return "失败";
      return Text(
        '失败',
        style: textTheme.bodySmall?.copyWith(color: Colors.red),
      );
    } else {
      final text = "${delay}ms";
      if (delay < 1000) {
        return Text(
          text,
          style: textTheme.bodySmall?.copyWith(color: Colors.green),
        );
      } else if (delay > 1000 && delay < 3000) {
        return Text(
          text,
          style: textTheme.bodySmall?.copyWith(color: Colors.orange),
        );
      } else {
        return Text(
          text,
          style: textTheme.bodySmall?.copyWith(color: Colors.red),
        );
      }
    }
  }
}
