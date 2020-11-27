import 'package:{{ PRO_NAME }}/util/tools/log.dart';
import 'package:flutter/material.dart';
import 'package:{{ PRO_NAME }}/util/tools/app_provider.dart';

import 'package:{{ PRO_NAME }}/router.dart';
import 'package:{{ PRO_NAME }}/pages/entrance.dart';
import 'package:{{ PRO_NAME }}/util/tools/app_sentry.dart';
import 'package:{{ PRO_NAME }}/widgets/common/error.dart';

/// APP 核心入口文件
void main() {
  Log.init(print: true);
  AppSentry.runWithCatchError(MyApp());
  // runApp(MyApp());
}

/// MyApp 核心入口界面
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
        future: AppProvider.getProviders(
          context,
          MaterialApp(
              title: '{{ PRO_NAME }}', // APP 名字
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue, // APP 主题
              ),
              routes: CommonRouter().registerRouter(),
              home: Entrance()),
        ),
        builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.error != null) {
            return Container(
              child: CommonError(),
            );
          }
          return Container(
            child: snapshot.data,
          );
        });
  }
}
