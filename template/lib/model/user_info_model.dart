import 'package:flutter/material.dart';

import 'package:{{ PRO_NAME }}/util/struct/user_info.dart';

/// 个人信息状态层
class UserInfoModel with ChangeNotifier {
  /// 系统用户个人信息
  final StructUserInfo myUserInfo;

  /// 构造函数
  UserInfoModel({this.myUserInfo});

  /// 获取用户信息
  StructUserInfo get value => myUserInfo;
}
