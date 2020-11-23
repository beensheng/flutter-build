import 'package:flutter/material.dart';

import 'package:{{ PRO_NAME }}/widgets/common/error.dart';

/// 首页
class HomePageIndex extends StatefulWidget {
  /// 构造函数
  const HomePageIndex();

  @override
  createState() => HomePageIndexState();
}

/// 具体的state类
class HomePageIndexState extends State<HomePageIndex> {
  /// 是否接口报错
  bool error = false;

  @override
  void initState() {
    super.initState();

    /// 初始化页面数据
    initPage();
  }

  /// 初始化页面数据
  void initPage() {}

  @override
  Widget build(BuildContext context) {
    if (error) {
      return CommonError(action: this.initPage);
    }
    return Text("main");
  }
}
