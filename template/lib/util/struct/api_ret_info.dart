/// api 拉取分页返回结构
///
/// {
///   "ret" : 0,
///   "message" : "success",
///   "hasMore" : true,
///   "lastId" : null,
/// }

/// 通用接口返回数据结构
class StructApiRetInfo {
  /// 用户的昵称
  final dynamic ret;

  /// 用户头像信息
  final String message;

  /// 具体的data信息
  final data;

  /// 构造函数
  StructApiRetInfo.newMessage(this.ret, this.message, this.data);

  /// 将对象转化为json数据
  static Map<String, dynamic> toJson(StructApiRetInfo retInfo) =>
      {'ret': retInfo.ret, 'message': retInfo.message, 'data': retInfo.data};

  /// 将json数据转化为对象数据
  StructApiRetInfo.fromJson(Map<String, dynamic> json)
      : ret = json['ret'] as dynamic,
        message = json['message'] as String,
        data = json['data'];
}
