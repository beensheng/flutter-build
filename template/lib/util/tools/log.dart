import 'package:flutter/cupertino.dart';
import 'package:stack_trace/stack_trace.dart';

/// 打印日志类
class Log {
  /// 是否打印
  static bool printable = false;

  /// 打印ICON
  static const Map ICON = {
    'DEBUG': '💚',
    'WARNING': '💛',
    'INFO': '💙',
    'ERROR': '❤️'
  };

  /// 初始化,设置是否打印
  static void init({bool print = false}) {
    printable = print;
  }

  /// debug打印
  static void d(Object object, [String tag, int layer = 1]) {
    _printLog(object, 'DEBUG', tag, layer);
  }

  /// waring打印
  static void w(Object object, [String tag, int layer = 1]) {
    _printLog(object, 'WARNING', tag, layer);
  }

  /// info打印
  static void i(Object object, [String tag, int layer = 1]) {
    _printLog(object, 'INFO', tag, layer);
  }

  /// error打印
  static void error(Object object, [String tag, int layer = 1]) {
    _printLog(object, 'ERROR', tag, layer);
  }

  /// 打印日志
  ///
  /// @param object 打印数据
  /// @param type 打印类型
  /// @param tag 头部标志
  /// @param layer 跟踪日志层级
  static void _printLog(Object object, String type, String tag, int layer) {
    if (printable) {
      final frame = Chain.current().toTrace().frames[layer + 1];
      if (tag == null) {
        tag = "${frame.member}";
      }
      print(frame);
      debugPrint("${ICON[type]} $tag --- $object");
    }
  }
}
