import 'package:clash_fudge/utils/log.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_mobile_vision/qr_camera.dart';

class ScanScreen extends StatefulHookConsumerWidget {
  const ScanScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScanScreenState();
}

class _ScanScreenState extends ConsumerState<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    final flashOn = useState(false);
    return Scaffold(
        body: QrCamera(
          qrCodeCallback: (code) {
            context.replace("/edit_sub", extra: {"url": code});
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            flashOn.value = !flashOn.value;
            QrCamera.toggleFlash();
          },
          child: Icon(flashOn.value ? Icons.flash_off : Icons.flash_on),
        ));
  }
}
