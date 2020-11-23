import 'dart:convert';

import 'package:{{ PRO_NAME }}/util/tools/Log.dart';
import 'package:dio/dio.dart';

import 'package:{{ PRO_NAME }}/util/tools/json_config.dart';

/// 统一调用API接口
class CallServer {
  /// get 方法
  static Future<Map<String, dynamic>> get(String apiName, [Map params]) async {
    Log.init(print: true);

    // 根据类型，获取api具体信息
    Map<String, dynamic> apis = await JsonConfig.getConfig('api');
    if (apis == null) {
      return {"ret": false};
    }
    String callApi = apis[apiName]['apiUrl'] as String;
    // 处理异常情况
    if (callApi == null) {
      return {"ret": false};
    }

    // 处理参数替换
    if (params != null) {
      params.forEach((k, v) => callApi = callApi.replaceAll('{$k}', '$v'));
    }
    Log.d("callApi: $callApi  |  params: $params", "start", 3);

    // 调用服务端接口获取返回数据
    try {
      var dio = Dio(BaseOptions(
        connectTimeout: 15000,
        receiveTimeout: 5000,
      ));
      Response response = await dio.get(callApi,
          options: Options(responseType: ResponseType.json));
      Map<String, dynamic> retInfo =
          json.decode(response.toString()) as Map<String, dynamic>;
      Log.i(retInfo, "result", 2);
      return retInfo;
    } catch (e) {
      Log.error(e, "api");
      return {"ret": 1};
    }
  }
}
