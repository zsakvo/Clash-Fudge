import 'package:clash_fudge/app_provider.dart';
import 'package:clash_fudge/components/dialog_sheet/dialog_sheet.dart';
import 'package:clash_fudge/models/app_config.dart';
import 'package:clash_fudge/ui/config/components/config_row.dart';
import 'package:clash_fudge/ui/config/components/label_checkbox.dart';
import 'package:clash_fudge/ui/config/config_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:clash_fudge/utils/constant.dart';
import 'package:clash_fudge/utils/system.dart';
import 'package:macos_ui/macos_ui.dart';

class GeneralConfig extends StatefulHookConsumerWidget {
  const GeneralConfig({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GeneralConfigState();
}

class _GeneralConfigState extends ConsumerState<GeneralConfig> {
  final controller = MacosTabController(
    initialIndex: 0,
    length: 3,
  );
  @override
  Widget build(BuildContext context) {
    final typography = MacosTypography.of(context);
    final autoStart = ref.watch(autoStartProvider);
    final allowLan = ref.watch(allowLanProvider);
    final testUrl = ref.watch(testUrlProvider);
    final testTimeout = ref.watch(testTimeoutProvider);
    final logLevel = ref.watch(logLevelProvider);
    final geoFile = ref.watch(geoFileProvider);
    final testUrlEditController = useTextEditingController(text: testUrl);
    final testTimeoutEditController = useTextEditingController(text: testTimeout.toString());
    final portEditController = useTextEditingController(text: ref.watch(portProvider).toString());
    final socksPortEditController = useTextEditingController(text: ref.watch(socksPortProvider).toString());
    final mixedPortEditController = useTextEditingController(text: ref.watch(mixedPortProvider).toString());
    final redirPortEditController = useTextEditingController(text: ref.watch(redirPortProvider).toString());
    final tproxyPortEditController = useTextEditingController(text: ref.watch(tproxyPortProvider).toString());
    final interfaceNameEditController = useTextEditingController(text: ref.watch(interfaceNameProvider));
    final controllerPortController = useTextEditingController(text: Const.clashServerUrl.replaceAll("127.0.0.1:", ""));
    final tun = ref.watch(tunProvider);
    final ipv6 = ref.watch(ipv6Provider);
    return DialogSheet(
      title: "通用",
      subtitle: "在这里可以找到大部分基础设置",
      width: 864,
      height: 600,
      child: MacosTabView(
        controller: controller,
        tabs: const [
          MacosTab(
            label: '通用',
          ),
          MacosTab(
            label: '端口',
          ),
          MacosTab(
            label: '高级',
          ),
        ],
        children: [
          Container(
            padding: const EdgeInsets.only(top: 32, left: 36, right: 36),
            decoration: BoxDecoration(
              color: const Color(0xffF2F2F2),
              border: Border.all(width: 1, color: const Color(0xffE7E7E7)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ConfigRow(
                    label: "启动",
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: LabelCheckbox(
                      label: '在登录时启动 Clash-Fudge',
                      value: autoStart,
                      onChanged: (val) {
                        ref.read(appConfigProvider.notifier).setAutoStart(val);
                      },
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Divider(
                    color: MacosColors.systemGrayColor.withOpacity(0.2),
                  ),
                ),
                ConfigRow(
                    label: "允许局域网连接",
                    padding: const EdgeInsets.only(bottom: 8),
                    child: LabelCheckbox(
                      label: '启动',
                      value: allowLan,
                      onChanged: (val) {
                        ref.read(appConfigProvider.notifier).setAllowLan(val);
                      },
                    )),
                ConfigRow(
                  label: "延迟测试 URL",
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: MacosTextField(
                    controller: testUrlEditController,
                    maxLines: 1,
                  ),
                ),
                ConfigRow(
                  label: "测试超时(秒)",
                  childWidth: 100,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: MacosTextField(
                    maxLines: 1,
                    controller: testTimeoutEditController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Divider(
                    color: MacosColors.systemGrayColor.withOpacity(0.2),
                  ),
                ),
                ConfigRow(
                  label: "日志级别",
                  childWidth: 100,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: MacosPopupButton(
                    items: const [
                      MacosPopupMenuItem(
                        value: LogLevel.debug,
                        child: Text("Debug"),
                      ),
                      MacosPopupMenuItem(
                        value: LogLevel.info,
                        child: Text("Info"),
                      ),
                      MacosPopupMenuItem(
                        value: LogLevel.warning,
                        child: Text("Warning"),
                      ),
                      MacosPopupMenuItem(
                        value: LogLevel.error,
                        child: Text("Error"),
                      ),
                      MacosPopupMenuItem(
                        value: LogLevel.silent,
                        child: Text("Silent"),
                      )
                    ],
                    value: logLevel,
                    onChanged: (value) {
                      ref.read(appConfigProvider.notifier).setLogLevel(value!);
                    },
                  ),
                ),
                ConfigRow(
                    label: "GeoIP 数据库",
                    crossAxisAlignment: CrossAxisAlignment.start,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        geoFile.whenOrNull(
                              data: (data) => Text(
                                data == null ? "未找到 GeoIP 数据库" : "修改时间：${data.lastModifiedSync()}",
                                style: typography.body,
                              ),
                            ) ??
                            Text(
                              "未找到 GeoIP 数据库",
                              style: typography.body,
                            ),
                        Text(
                          '数据文件来自：https://github.com/MetaCubeX/meta-rules-dat/releases/download/latest/geoip.metadb',
                          style: typography.subheadline
                              .copyWith(color: MacosColors.systemGrayColor.withOpacity(0.8), height: 1.7),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8,
                          ),
                          child: PushButton(
                            controlSize: ControlSize.regular,
                            onPressed: () {
                              ref.read(geoFileProvider.notifier).fetch();
                            },
                            secondary: true,
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 24),
                              child: Text("现在更新"),
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.only(top: 32, left: 36, right: 36),
              decoration: BoxDecoration(
                color: const Color(0xffF2F2F2),
                border: Border.all(width: 1, color: const Color(0xffE7E7E7)),
              ),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                ConfigRow(
                  label: "Http Port",
                  childWidth: 200,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: MacosTextField(
                    maxLines: 1,
                    controller: portEditController,
                  ),
                ),
                ConfigRow(
                  label: "Socks5 Port",
                  childWidth: 200,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: MacosTextField(
                    maxLines: 1,
                    controller: socksPortEditController,
                  ),
                ),
                ConfigRow(
                  label: "Mixed Port",
                  childWidth: 200,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: MacosTextField(
                    maxLines: 1,
                    controller: mixedPortEditController,
                  ),
                ),
                ConfigRow(
                  label: "Redir Port",
                  childWidth: 200,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: MacosTextField(
                    maxLines: 1,
                    controller: redirPortEditController,
                  ),
                ),
                ConfigRow(
                  label: "TProxy Port",
                  childWidth: 200,
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: MacosTextField(
                    maxLines: 1,
                    controller: tproxyPortEditController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Divider(
                    color: MacosColors.systemGrayColor.withOpacity(0.2),
                  ),
                ),
                ConfigRow(
                  label: "Controller Port",
                  childWidth: 200,
                  padding: const EdgeInsets.only(bottom: 36),
                  child: MacosTextField(
                    maxLines: 1,
                    enabled: false,
                    controller: controllerPortController,
                  ),
                ),
              ])),
          Container(
            padding: const EdgeInsets.only(top: 32, left: 36, right: 36),
            decoration: BoxDecoration(
              color: const Color(0xffF2F2F2),
              border: Border.all(width: 1, color: const Color(0xffE7E7E7)),
            ),
            child: Column(
              children: [
                ConfigRow(
                  label: "内核静默提权",
                  childWidth: 200,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: PushButton(
                          controlSize: ControlSize.regular,
                          onPressed: () {
                            SystemUtil.createMacSudoer();
                          },
                          secondary: true,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Text("申请权限"),
                          ),
                        ),
                      ),
                      Container(
                        width: 200,
                        margin: const EdgeInsets.only(top: 8),
                        child: PushButton(
                          controlSize: ControlSize.regular,
                          onPressed: () {
                            SystemUtil.clearMacSudoer();
                          },
                          secondary: true,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Text("撤销权限"),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Divider(
                    color: MacosColors.systemGrayColor.withOpacity(0.2),
                  ),
                ),
                ConfigRow(
                    label: "IPv6 支持",
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: LabelCheckbox(
                      label: '启动',
                      value: ipv6,
                      onChanged: (val) {
                        ref.read(appConfigProvider.notifier).setIpv6(val);
                      },
                    )),
                // ConfigRow(
                //     label: "SNI 嗅探",
                //     padding: const EdgeInsets.symmetric(vertical: 2),
                //     child: LabelCheckbox(
                //       label: '启动',
                //       value: true,
                //       onChanged: (p0) {},
                //     )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Divider(
                    color: MacosColors.systemGrayColor.withOpacity(0.2),
                  ),
                ),
                ConfigRow(
                  label: "TUN IP Stack",
                  childWidth: 100,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: MacosPopupButton(
                    items: const [
                      MacosPopupMenuItem(
                        value: TunStack.system,
                        child: Text("System"),
                      ),
                      MacosPopupMenuItem(
                        value: TunStack.gvisor,
                        child: Text("gVisor"),
                      ),
                      MacosPopupMenuItem(
                        value: TunStack.mixed,
                        child: Text("Mixed"),
                      ),
                    ],
                    value: tun.stack,
                    onChanged: (val) {
                      ref.read(appConfigProvider.notifier).setTunStack(val!);
                    },
                  ),
                ),
                // ConfigRow(
                //   label: "设备名称",
                //   childWidth: 200,
                //   padding: const EdgeInsets.only(top: 8, bottom: 6),
                //   child: MacosTextField(
                //     controller: deviceController,
                //     maxLines: 1,
                //   ),
                // ),
                ConfigRow(
                  label: "接口名称",
                  childWidth: 200,
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: MacosTextField(
                    maxLines: 1,
                    controller: interfaceNameEditController,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Divider(
                    color: MacosColors.systemGrayColor.withOpacity(0.2),
                  ),
                ),
                ConfigRow(
                  label: "FakeIP",
                  childWidth: 200,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: PushButton(
                    controlSize: ControlSize.regular,
                    onPressed: () {
                      ref.read(appConfigProvider.notifier).flushFakeIp();
                    },
                    secondary: true,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text("清空 FakeIP 数据库"),
                    ),
                  ),
                ),
                ConfigRow(
                  label: "Restart",
                  childWidth: 200,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: PushButton(
                    controlSize: ControlSize.regular,
                    onPressed: () {
                      ref.read(appConfigProvider.notifier).restartCore();
                    },
                    secondary: true,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text("重启 Clash 核心"),
                    ),
                  ),
                ),
                ConfigRow(
                  label: "Reload",
                  childWidth: 200,
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: PushButton(
                    controlSize: ControlSize.regular,
                    onPressed: () {
                      ref.read(appConfigProvider.notifier).reloadProfile();
                    },
                    secondary: true,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text("重载配置文件"),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      onNegative: () {
        Navigator.of(context).pop();
      },
      onPositive: () {
        final testUrl = testUrlEditController.text;
        final testTimeout = int.tryParse(testTimeoutEditController.text);
        final port = int.tryParse(portEditController.text);
        final socksPort = int.tryParse(socksPortEditController.text);
        final mixedPort = int.tryParse(mixedPortEditController.text);
        final redirPort = int.tryParse(redirPortEditController.text);
        final tproxyPort = int.tryParse(tproxyPortEditController.text);
        final interfaceName = interfaceNameEditController.text;
        ref.read(appConfigProvider.notifier).setNormalTextFieldVal({
          "testUrl": testUrl,
          "testTimeout": testTimeout,
          "core.port": port,
          "core.socks-port": socksPort,
          "core.mixed-port": mixedPort,
          "core.redir-port": redirPort,
          "core.tproxy-port": tproxyPort,
          "core.interface-name": interfaceName,
          // "core.tun.device": tunDeviceName
        });
        Navigator.of(context).pop();
      },
    );
  }
}
