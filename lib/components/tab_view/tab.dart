import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart' hide MacosTab;

const _kTabBorderRadius = BorderRadius.all(
  Radius.circular(4.0),
);

/// {@template macosTab}
/// A macOS-style navigational button used to move between the views of a
/// [MacosTabView].
/// {@endtemplate}
class MacosTab extends StatelessWidget {
  /// {@macro macosTab}
  const MacosTab(
      {super.key,
      required this.label,
      this.labelStyle,
      this.active = false,
      this.prefixIcon,
      this.tabPadding = const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 3,
      )});

  final Widget? prefixIcon;

  /// The padding for this tab.
  final EdgeInsetsGeometry tabPadding;

  /// The display label style for this tab.
  final TextStyle? labelStyle;

  /// The display label text for this tab.
  final String label;

  /// Whether this [MacosTab] is currently selected. Handled internally by
  /// [MacosSegmentedControl]'s build function.
  final bool active;

  @override
  Widget build(BuildContext context) {
    final brightness = MacosTheme.brightnessOf(context);
    return PhysicalModel(
      color: active ? const Color(0xFF2B2E33) : MacosColors.transparent,
      borderRadius: _kTabBorderRadius,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: _kTabBorderRadius,
          color: active
              ? brightness.resolve(
                  MacosColors.white,
                  const Color(0xFF646669),
                )
              : MacosColors.transparent,
        ),
        child: Padding(
          padding: tabPadding,
          child: Row(children: [
            if (prefixIcon != null)
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: prefixIcon!,
              ),
            Text(
              label,
              style: labelStyle,
            )
          ]),
        ),
      ),
    );
  }

  /// Copies this [MacosTab] into another.
  MacosTab copyWith({
    String? label,
    TextStyle? labelStyle,
    bool? active,
    EdgeInsetsGeometry? tabPadding,
    Widget? prefixIcon,
  }) {
    return MacosTab(
      label: label ?? this.label,
      active: active ?? this.active,
      labelStyle: labelStyle ?? this.labelStyle,
      tabPadding: tabPadding ?? this.tabPadding,
      prefixIcon: prefixIcon ?? this.prefixIcon,
    );
  }
}
