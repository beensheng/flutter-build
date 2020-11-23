import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:{{ PRO_NAME }}/api/user_info/index.dart';
import 'package:{{ PRO_NAME }}/model/user_info_model.dart';
import 'package:{{ PRO_NAME }}/util/struct/user_info.dart';
import 'package:{{ PRO_NAME }}/widgets/common/error.dart';

/// 处理所有 provider
class AppProvider {
  /// 部分数据需要获取初始值
  static Future<Widget> getProviders(BuildContext context, Widget child) async {
    // json协议
    StructUserInfo myUserInfo = await ApiUserInfoIndex.getSelfUserInfo();
    if (myUserInfo == null) {
      return MaterialApp(
          title: '{{ PRO_NAME }}', // APP 名字
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.lightBlueAccent, // APP 主题
          ),
          home: CommonError());
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => UserInfoModel(myUserInfo: myUserInfo)),
      ],
      child: child,
    );
  }
}
