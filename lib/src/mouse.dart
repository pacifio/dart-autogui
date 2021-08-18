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
const _kDefaultButton = "left";

enum MouseTween {
  linear,
  easeInQuad,
  easeOutQuad,
  easeInOutQuad,
  easeInBounce,
  easeInElastic
}

enum MouseButton {
  left,
  middle,
  right,
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

String _mapButton(MouseButton? button) {
  if (button != null) {
    if (button == MouseButton.left) {
      return _kDefaultButton;
    } else if (button == MouseButton.right) {
      return 'right';
    } else {
      return _kDefaultButton;
    }
  } else {
    return _kDefaultButton;
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

  static Future<void> dragTo({
    required int x,
    required int y,
    Duration? duration,
    MouseTween? tween,
    MouseButton? button,
  }) async {
    final path = getScriptPath('mouse.py');
    await Process.run('python3', [
      path,
      'drag_to',
      x.toString(),
      y.toString(),
      duration != null ? duration.inSeconds.toString() : '0',
      _mapTween(tween),
      _mapButton(button),
    ]);
  }

  static Future<void> dragRel({
    required int x,
    required int y,
    Duration? duration,
    MouseTween? tween,
    MouseButton? button,
  }) async {
    final path = getScriptPath('mouse.py');
    await Process.run('python3', [
      path,
      'drag_rel',
      x.toString(),
      y.toString(),
      duration != null ? duration.inSeconds.toString() : '0',
      _mapTween(tween),
      _mapButton(button),
    ]);
  }

  static Future<void> click({
    required int x,
    required int y,
    int clicks = 1,
    int intervals = 0,
    Duration? duration,
    MouseTween? tween,
    MouseButton? button,
  }) async {
    final path = getScriptPath('mouse.py');
    await Process.run('python3', [
      path,
      'click',
      x.toString(),
      y.toString(),
      clicks.toString(),
      intervals.toString(),
      _mapButton(button),
      duration != null ? duration.inSeconds.toString() : '0',
      _mapTween(tween),
    ]);
  }

  static Future<void> rightClick({
    required int x,
    required int y,
    int clicks = 1,
    int intervals = 0,
    Duration? duration,
    MouseTween? tween,
  }) async {
    final path = getScriptPath('mouse.py');
    await Process.run('python3', [
      path,
      'click',
      x.toString(),
      y.toString(),
      clicks.toString(),
      intervals.toString(),
      _mapButton(MouseButton.right),
      duration != null ? duration.inSeconds.toString() : '0',
      _mapTween(tween),
    ]);
  }

  static Future<void> leftClick({
    required int x,
    required int y,
    int clicks = 1,
    int intervals = 0,
    Duration? duration,
    MouseTween? tween,
  }) async {
    final path = getScriptPath('mouse.py');
    await Process.run('python3', [
      path,
      'click',
      x.toString(),
      y.toString(),
      clicks.toString(),
      intervals.toString(),
      _mapButton(MouseButton.left),
      duration != null ? duration.inSeconds.toString() : '0',
      _mapTween(tween),
    ]);
  }

  static Future<void> middleClick({
    required int x,
    required int y,
    int clicks = 1,
    int intervals = 0,
    Duration? duration,
    MouseTween? tween,
  }) async {
    final path = getScriptPath('mouse.py');
    await Process.run('python3', [
      path,
      'click',
      x.toString(),
      y.toString(),
      clicks.toString(),
      intervals.toString(),
      _mapButton(MouseButton.middle),
      duration != null ? duration.inSeconds.toString() : '0',
      _mapTween(tween),
    ]);
  }

  static Future<void> doubleClick({
    required int x,
    required int y,
    int intervals = 0,
    Duration? duration,
    MouseTween? tween,
    MouseButton? button,
  }) async {
    final path = getScriptPath('mouse.py');
    await Process.run('python3', [
      path,
      'click',
      x.toString(),
      y.toString(),
      2.toString(),
      intervals.toString(),
      _mapButton(button),
      duration != null ? duration.inSeconds.toString() : '0',
      _mapTween(tween),
    ]);
  }

  static Future<void> trippleClick({
    required int x,
    required int y,
    int intervals = 0,
    Duration? duration,
    MouseTween? tween,
    MouseButton? button,
  }) async {
    final path = getScriptPath('mouse.py');
    await Process.run('python3', [
      path,
      'click',
      x.toString(),
      y.toString(),
      3.toString(),
      intervals.toString(),
      _mapButton(button),
      duration != null ? duration.inSeconds.toString() : '0',
      _mapTween(tween),
    ]);
  }
}
