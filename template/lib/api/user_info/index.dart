import 'package:{{ PRO_NAME }}/util/struct/api_ret_info.dart';
import 'package:{{ PRO_NAME }}/util/struct/user_info.dart';
import 'package:{{ PRO_NAME }}/util/tools/call_server.dart';

/// 获取用户接口信息
class ApiUserInfoIndex {
  /// 获取个人信息
  static Future<StructUserInfo> getSelfUserInfo() async {
    // Map<String, dynamic> retJson =
    //     await CallServer.get('userInfo', {'id': '1002'});
    // StructApiRetInfo retInfo = StructApiRetInfo.fromJson(retJson);
    // if (retInfo.ret != 0 || retInfo.data == null) {
    //   return null;
    // }

    Map<String, dynamic> data = {
      'uid': '1002',
      'nickName': '微光倾城',
      'headerUrl':
          'http://img.mp.itc.cn/upload/20170331/b42bab17f4784f7bb1e765888b8c4f2e_th.jpeg'
    };

    StructUserInfo userInfo =
        StructUserInfo.fromJson(data as Map<String, dynamic>);
    return userInfo;
  }
}
