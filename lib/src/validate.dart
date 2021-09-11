import 'dart:io';
import 'package:dart_autogui/src/utils.dart';

/// Path for validate_module.py script
final vPath = getScriptPath('validate_module.py');

class Validate {
  static Future<bool> installed() async {
    final data = await Process.run('python3', [
      vPath,
    ]);
    final s = data.stdout.toString().trim();
    if (s == "True") {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }
}
