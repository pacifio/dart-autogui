import 'dart:convert';
import 'dart:io';

import 'package:dart_autogui/src/utils.dart';

class MousePosition {
  final int x;
  final int y;

  MousePosition({
    required this.x,
    required this.y,
  });
}

class Mouse {
  Future<MousePosition> getPosition() async {
    try {
      final path = getScriptPath('mouse.py');
      final data = await Process.run('python3', [path, 'pos']);
      final pos = jsonDecode(data.stdout.toString());

      return MousePosition(x: pos['x'], y: pos['y']);
    } on ProcessException catch (_) {
      return MousePosition(x: 0, y: 0);
    }
  }
}
