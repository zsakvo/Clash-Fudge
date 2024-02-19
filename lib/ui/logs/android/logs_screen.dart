import 'package:clash_fudge/providers/log_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LogsScreen extends ConsumerStatefulWidget {
  const LogsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LogsScreenState();
}

class _LogsScreenState extends ConsumerState<LogsScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final logs = ref.watch(logProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("内核日志"),
        titleSpacing: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
              color: colorScheme.error,
            ),
            onPressed: () {
              ref.read(logProvider.notifier).clear();
            },
          ),
          MenuAnchor(
            alignmentOffset: Offset(-92, 0),
            menuChildren: [
              MenuItemButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(120, 40)),
                  ),
                  child: const Text("Info"),
                  onPressed: () {
                    ref.read(logProvider.notifier).filter("info");
                  }),
              MenuItemButton(
                  child: const Text("Debug"),
                  onPressed: () {
                    ref.read(logProvider.notifier).filter("debug");
                  }),
              MenuItemButton(
                  child: const Text("Warning"),
                  onPressed: () {
                    ref.read(logProvider.notifier).filter("warning");
                  }),
              MenuItemButton(
                  child: const Text("Error"),
                  onPressed: () {
                    ref.read(logProvider.notifier).filter("error");
                  }),
            ],
            builder: (context, controller, child) {
              return IconButton(
                icon: Icon(
                  Icons.filter_list_alt,
                  color: colorScheme.secondary,
                ),
                onPressed: () {
                  controller.isOpen ? controller.close() : controller.open();
                },
              );
            },
          ),
        ],
      ),
      body: Container(
        child: ListView.separated(
          itemBuilder: (context, index) {
            final log = logs[index];
            return ListTile(
              title: Text(
                log.type.toUpperCase(),
                style: TextStyle(color: getTypeColor(log.type)),
              ),
              subtitle: Text(log.payload),
            );
          },
          itemCount: logs.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              indent: 18,
              endIndent: 18,
              color: colorScheme.secondaryContainer.withOpacity(0.6),
            );
          },
        ),
      ),
    );
  }

  getTypeColor(String type) {
    switch (type) {
      case "info":
        return Colors.green;
      case "warning":
        return Colors.orange;
      case "error":
        return Colors.red;
      case "debug":
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
