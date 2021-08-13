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
  static Future<MousePosition> getPosition() async {
    try {
      final path = getScriptPath('mouse.py');
      final data = await Process.run('python3', [path, 'pos']);
      final pos = jsonDecode(data.stdout.toString());

      return MousePosition(x: pos['x'], y: pos['y']);
    } on ProcessException catch (_) {
      return MousePosition(x: 0, y: 0);
    }
  }

  static Future<void> move({
    required int x,
    required int y,
    Duration? duration,
  }) async {
    final path = getScriptPath('mouse.py');
    await Process.run('python3', [
      path,
      'move',
      x.toString(),
      y.toString(),
      duration != null ? duration.inSeconds.toString() : '0',
    ]);
  }
}
