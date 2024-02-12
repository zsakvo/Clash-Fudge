import 'package:clash_fudge/android_app_provider.dart';
import 'package:clash_fudge/models/app_config.dart';
import 'package:clash_fudge/ui/config/android/components/svg.dart';
import 'package:clash_fudge/utils/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'selectable_palette.dart';

class PaletteScreen extends StatefulHookConsumerWidget {
  const PaletteScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PaletteScreenState();
}

class _PaletteScreenState extends ConsumerState<PaletteScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final colorSeed = ref.watch(appColorProvider).value;
    final elevationBackground = ElevationOverlay.applySurfaceTint(colorScheme.surface, colorScheme.primary, 2);
    return Scaffold(
        backgroundColor: elevationBackground,
        body: SafeArea(
          child: CustomScrollView(slivers: [
            SliverAppBar(
              pinned: true,
              // title: const Text(
              //   "选择主题色",
              //   style: TextStyle(fontSize: 20),
              // ),
              centerTitle: false,
              leading: IconButton(
                  onPressed: () {
                    GoRouter.of(context).pop();
                  },
                  icon: SvgPicture.asset(
                    "assets/icon/back.svg",
                    width: 23,
                    height: 23,
                    colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.secondary, BlendMode.srcIn),
                  )),
              titleSpacing: 0,
              scrolledUnderElevation: 0,
              backgroundColor: elevationBackground,
            ),
            SliverPadding(
              padding: const EdgeInsets.only(
                left: 24,
                top: 60,
              ),
              sliver: SliverToBoxAdapter(
                  child: Text(
                "选择主题色",
                style: TextStyle(
                    fontSize: 34, fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.onBackground),
              )),
            ),
            SliverToBoxAdapter(
                child: Container(
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.surface, borderRadius: BorderRadius.circular(24)),
              padding: const EdgeInsets.only(top: 48, bottom: 48, left: 48, right: 48),
              margin: const EdgeInsets.only(bottom: 24, top: 16, left: 24, right: 24),
              child: SvgPicture.string(
                parseDynamicColor(PALETTE_SVG, primaryColor: Theme.of(context).colorScheme.primary.value),
                height: 120,
              ),
            )),
            SliverPadding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
              sliver: SliverGrid.extent(
                  maxCrossAxisExtent: 92,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 8,
                  children: PresetColors.values.map(
                    (color) {
                      // final color = PresetColors.values[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: SelectablePalette(
                          color: color,
                          isSelected: color.color.value == colorSeed,
                        ),
                      );
                    },
                    // itemCount: PresetColors.values.length,
                    // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    //     crossAxisCount: 4,
                    //     mainAxisSpacing: 8,
                    //     crossAxisSpacing: 0,
                    //     childAspectRatio: 1.1)
                  ).toList()),
            )
          ]),
        ));
  }
}
