import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:window_manager/window_manager.dart';

class _WindowCloseHook extends Hook<void> {
  const _WindowCloseHook(this.effect);

  final void Function() effect;

  @override
  _WindowCloseHookState createState() => _WindowCloseHookState();
}

class _WindowCloseHookState extends HookState<void, _WindowCloseHook> with WindowListener {
  @override
  void initHook() {
    windowManager.addListener(this);
    super.initHook();
  }

  @override
  void onWindowClose() {
    hook.effect();
    super.onWindowClose();
  }

  @override
  void build(BuildContext context) {}

  @override
  String get debugLabel => 'useWindowClose';

  @override
  bool get debugSkipValue => true;
}

void useWindowClose(void Function() effect) {
  use(_WindowCloseHook(
    effect,
  ));
}

///

class _WindowFocusHook extends Hook<void> {
  const _WindowFocusHook(this.effect);

  final void Function() effect;

  @override
  _WindowFocusHookState createState() => _WindowFocusHookState();
}

class _WindowFocusHookState extends HookState<void, _WindowFocusHook> with WindowListener {
  @override
  void initHook() {
    windowManager.addListener(this);
    super.initHook();
  }

  @override
  void onWindowFocus() {
    hook.effect();
    super.onWindowFocus();
  }

  @override
  void build(BuildContext context) {}

  @override
  String get debugLabel => 'useWindowClose';

  @override
  bool get debugSkipValue => true;
}

void useWindowFocus(void Function() effect) {
  use(_WindowFocusHook(
    effect,
  ));
}

///

class _IsWindowClosedHook extends Hook<bool> {
  const _IsWindowClosedHook() : super();

  @override
  _IsWindowClosedHookState createState() => _IsWindowClosedHookState();
}

class _IsWindowClosedHookState extends HookState<bool, _IsWindowClosedHook> with WindowListener {
  bool _isClosed = false;

  @override
  void initHook() {
    windowManager.addListener(this);
    super.initHook();
  }

  @override
  bool build(BuildContext context) => _isClosed;

  @override
  void onWindowClose() {
    _isClosed = true;
    super.onWindowClose();
  }

  @override
  void onWindowFocus() {
    _isClosed = false;
    super.onWindowFocus();
  }

  @override
  String get debugLabel => 'useIsWindowClosed';

  @override
  bool get debugSkipValue => true;
}

bool useIsWindowClosed() {
  return use(const _IsWindowClosedHook());
}
