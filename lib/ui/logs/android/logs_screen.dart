import 'package:clash_fudge/providers/log_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LogsScreen extends StatefulHookConsumerWidget {
  const LogsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LogsScreenState();
}

class _LogsScreenState extends ConsumerState<LogsScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final logPro = ref.watch(logProvider);
    final logs = logPro.$1;
    final level = logPro.$2;
    final buildMenuItem = useCallback((String lv) {
      return MenuItemButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(120, 40)),
          ),
          trailingIcon: Icon(
            Icons.check,
            color: lv == level.name ? null : Colors.transparent,
          ),
          child: Text(lv[0].toUpperCase() + lv.substring(1)),
          onPressed: () {
            ref.read(logProvider.notifier).filter(lv);
          });
    }, [level]);
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
            alignmentOffset: const Offset(-92, 0),
            menuChildren: [
              buildMenuItem("info"),
              buildMenuItem("debug"),
              buildMenuItem("warning"),
              buildMenuItem("error"),
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
