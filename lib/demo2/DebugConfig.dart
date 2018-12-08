class DebugConfig {
  //当前是否是debug模式
  static bool get debug {
    bool _debug = false;
    assert(() {
      _debug = true;
      return true;
    }());
  }

  //http 代理服务器IP
  static String proxyIp;

  //http 代理服务器端口号
  static int proxyPrort;
}
