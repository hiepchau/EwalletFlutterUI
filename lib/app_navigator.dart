import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppNav {
  static late GlobalKey<NavigatorState>? _webNavKey;

  static void init() {
    if (kIsWeb) {
      _webNavKey = GlobalKey<NavigatorState>();
    } else {
      _webNavKey = null;
    }
  }

  static GlobalKey<NavigatorState> getWebNavKey() {
    if (!kIsWeb) {
      throw Exception('Web Navigator Key is not available');
    }
    return _webNavKey!;
  }

  static void push(BuildContext context, Widget page) {
    if (kIsWeb) {
      _webNavKey!.currentState!
          .push(MaterialPageRoute(builder: (context) => page));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => page));
    }
  }

  static void pop(BuildContext context) {
    if (kIsWeb) {
      _webNavKey!.currentState!.pop();
    } else {
      Navigator.pop(context);
    }
  }
}
