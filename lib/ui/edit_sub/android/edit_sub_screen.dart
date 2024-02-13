import 'package:clash_fudge/providers/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EditSubScreen extends StatefulHookConsumerWidget {
  const EditSubScreen({super.key, this.url});
  final String? url;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditSubScreenState();
}

class _EditSubScreenState extends ConsumerState<EditSubScreen> {
  @override
  Widget build(BuildContext context) {
    final subscriber = ref.watch(clashProfileSubscriberProvider);
    final urlController = useTextEditingController(text: widget.url);
    return Scaffold(
      appBar: AppBar(
        title: const Text("编辑订阅"),
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: urlController,
              decoration: const InputDecoration(
                labelText: "订阅地址",
                hintText: "请输入订阅地址",
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          ref.read(clashProfileSubscriberProvider.notifier).importFromUrl(url: urlController.text, name: "").then((_) {
            context.pop();
          });
        },
        child: subscriber.when(
          data: (value) {
            return const Icon(Icons.done);
          },
          error: (error, stackTrace) {
            return const Icon(Icons.done);
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
      ),
    );
  }
}
