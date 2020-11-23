import 'package:flutter/material.dart';

/// 左侧菜单
class MenuDraw extends StatelessWidget {
  /// 外部跳转
  final Function redirect;

  /// 默认构造函数
  const MenuDraw(this.redirect);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.view_list),
              title: Text('webview'),
              onTap: () {
                Navigator.pop(context);
                redirect('https://www.baidu.com/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
