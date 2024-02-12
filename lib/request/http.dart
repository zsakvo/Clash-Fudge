/// 解析逻辑来自 https://github.com/mapleafgo/clash-for-flutter/blob/main/lib/app/source/request.dart

import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:dio/dio.dart';
import 'package:clash_fudge/enums/type.dart';
// import 'package:clash_fudge/models/clash_config.dart.bak';
import 'package:clash_fudge/models/clash_profile_subscriber.dart';
import 'package:clash_fudge/models/clash_proxy.dart';
import 'package:clash_fudge/utils/constant.dart';
import 'package:clash_fudge/utils/log.dart';
import 'package:local_notifier/local_notifier.dart';

class Http {
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: "http://${Const.clashServerUrl}",
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 5),
    headers: {'User-Agent': 'Clash-Fudge/1.0.0'},
  ))
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          final path = error.requestOptions.path;
          if (path != '/') {
            Log.e([error.requestOptions.path.toString(), error.requestOptions.data, error.response?.data],
                error.requestOptions.uri.toString());
            // final errText = (error.response?.statusCode.toString() ?? "") + (error.response?.data.toString() ?? "");
            // LocalNotification(title: "内核通信错误", body: errText, actions: [LocalNotificationAction(text: "复制")])
            //   ..onClick = () {
            //     FlutterClipboard.copy(errText);
            //   }
            //   ..show();
          }
          return handler.next(error);
        },
      ),
    );

  static Future<Response> _downloadFile({
    required String url,
    required String path,
    void Function(int, int)? onReceiveProgress,
  }) {
    return _dio.download(url, path, onReceiveProgress: onReceiveProgress);
  }

  static Future<ClashProfileSubscriber> fetchProfile(
      {required ClashProfileSubscriber subscriber, required String profileDirPath}) async {
    // String profileDirPath = "${(await getApplicationDocumentsDirectory()).path}/profiles";
    String defaultName = subscriber.name.isEmpty ? "Clash_${DateTime.now().millisecondsSinceEpoch}" : subscriber.name;
    return _downloadFile(url: subscriber.url!, path: "$profileDirPath/$defaultName.yaml").then((resp) {
      var headerDis = resp.headers.value("content-disposition");
      String? filename;

      if (headerDis != null) {
        var disposition = HeaderValue.parse(headerDis);
        disposition.parameters.forEach((key, value) {
          if (key.startsWith("filename")) {
            if (key == "filename*") {
              filename = Uri.decodeComponent((value ?? "").split("'").last);
            } else {
              filename = value;
            }
          }
        });
      }

      late ClashProfileSubscriber sub = subscriber;
      if (filename?.isNotEmpty ?? false) {
        File("$profileDirPath/$defaultName.yaml").renameSync("$profileDirPath/$filename");
        if (subscriber.name.isEmpty) {
          sub = subscriber.copyWith(name: filename!.replaceAll(".yaml", ""));
        }
      } else {
        sub = subscriber.copyWith(name: defaultName);
      }
      // 解析流量信息
      var headerInfo = resp.headers.value("subscription-userinfo");
      if (headerInfo != null) {
        sub = sub.copyWith(userinfo: SubUserInfo.fromHeader(headerInfo));
      }
      // 解析更新间隔
      var value = resp.headers.value("profile-update-interval");
      if (value != null && sub.interval == 0) {
        sub = sub.copyWith(interval: int.parse(value));
      }
      return sub;
    });
  }

  static Future<void> changeConfig(String path) async {
    if (!File(path).existsSync()) return;
    await _dio.put('/configs', queryParameters: {"force": true}, data: {'path': path, 'payload': ''});
  }

  static Future<(List<ClashProxy>, List<ClashProxy>)> fetchProxies() async {
    return _dio.get('/proxies').then((value) {
      var proxiesValue = value.data['proxies'] as Map<String, dynamic>;
      final List<ClashProxy> selectors = [];
      final List<ClashProxy> proxies = [];
      for (var element in proxiesValue.values) {
        final proxy = ClashProxy.fromJson(element);
        if (ClashSelectorType.contains(proxy.type)) {
          selectors.add(proxy);
        } else if (ClashProxyType.contains(proxy.type)) {
          proxies.add(proxy);
        } else {
          Log.e("未知类型的代理：${proxy.type}");
        }
      }
      return (proxies, selectors);
    });
  }

  static Future patchConfig(Map<String, dynamic> data) async {
    return _dio.patch('/configs', data: data);
  }

  static Future<bool> changeProxy({required String group, required String name}) async {
    var resp = await _dio.put<void>(
      "/proxies/$group",
      data: {"name": name},
    );
    return resp.statusCode == HttpStatus.noContent;
  }

  static Future<Response<dynamic>> proxyPing({
    required String name,
    int timeout = 5,
    String url = "http://connect.rom.miui.com/generate_204",
  }) async {
    return _dio.get("/proxies/$name/delay", queryParameters: {"url": url, 'timeout': timeout * 1000});
  }

  static Future rules() async {
    final res = await _dio.get("/rules");
    return res.data["rules"];
  }

  static Future closeConnection(String id) async {
    return _dio.delete("/connections/$id");
  }

  static Future hello() async {
    try {
      final res = await _dio.get("/");
      return res.statusCode;
    } catch (e) {
      return -1;
    }
  }

  static version() async {
    final res = await _dio.get("/version");
    return res.data;
  }

  static flushFakeIp() async {
    return _dio.post("/cache/fakeip/flush");
  }

  static upgradeCore(String path) async {
    return _dio.post("/upgrade", data: {"path": path, "payload": ""});
  }

  static restartCore(String path) async {
    return _dio.post("/restart", data: {"path": path, "payload": ""});
  }

  static geo(String path) async {
    return _dio.post("/configs/geo", data: {"path": path, "payload": ""});
  }
}
