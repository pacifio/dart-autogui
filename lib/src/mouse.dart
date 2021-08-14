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

const _kDefaultTween = "linear";

enum MouseTween {
  linear,
  easeInQuad,
  easeOutQuad,
  easeInOutQuad,
  easeInBounce,
  easeInElastic
}

String _mapTween(MouseTween? tween) {
  if (tween != null) {
    if (tween == MouseTween.linear) {
      return _kDefaultTween;
    } else if (tween == MouseTween.easeInQuad) {
      return 'ease-in';
    } else if (tween == MouseTween.easeOutQuad) {
      return 'ease-out';
    } else if (tween == MouseTween.easeInOutQuad) {
      return 'ease-in-out';
    } else if (tween == MouseTween.easeInBounce) {
      return 'bounce';
    } else if (tween == MouseTween.easeInElastic) {
      return 'elastic';
    } else {
      return _kDefaultTween;
    }
  } else {
    return _kDefaultTween;
  }
}

class Mouse {
  static Future<MousePosition> pos() async {
    final path = getScriptPath('mouse.py');
    final data = await Process.run('python3', [path, 'pos']);
    final pos = jsonDecode(data.stdout.toString());

    return MousePosition(x: pos['x'], y: pos['y']);
  }

  static Future<void> moveTo({
    required int x,
    required int y,
    Duration? duration,
    MouseTween? tween,
  }) async {
    final path = getScriptPath('mouse.py');
    await Process.run('python3', [
      path,
      'move_to',
      x.toString(),
      y.toString(),
      duration != null ? duration.inSeconds.toString() : '0',
      _mapTween(tween),
    ]);
  }

  static Future<void> moveRel({
    required int x,
    required int y,
    Duration? duration,
  }) async {
    final path = getScriptPath('mouse.py');
    await Process.run('python3', [
      path,
      'move_rel',
      x.toString(),
      y.toString(),
      duration != null ? duration.inSeconds.toString() : '0',
    ]);
  }
}
