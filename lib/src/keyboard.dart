import 'dart:convert';
import 'dart:io';
import 'package:dart_autogui/src/utils.dart';

/// Path for keyboard.py script
final kPath = getScriptPath('keyboard.py');

/// Main `Keyboard` object
class Keyboard {
  /// Returs a `Future<List<String>>` of all the available keys within your system
  static Future<List<String>> keyboardKeys() async {
    final data = await Process.run('python3', [kPath, 'keys']);
    final keys = jsonDecode(data.stdout.toString()) as List<dynamic>;
    final mapped = keys.map((e) => e.toString()).toList();
    mapped.removeWhere((element) => element.trim() == '');
    return Future.value(mapped);
  }

  /// Type a sentence , `int interval` is by default `0`
  static Future<void> typeWord(
    String word, {
    int interval = 0,
  }) async {
    await Process.run('python3', [
      kPath,
      'type_word',
      word,
      interval.toString(),
    ]);
  }

  /// Simulate a hotkey press , e.g `Ctrl+i`
  /// Example usage
  /// ```dart
  /// Keyboard.hoteKey(['ctrl', 'v'])
  /// // Simulates Ctrl+V press
  /// ```
  static Future<void> hotKey(List<String> keys) async {
    if (keys.isNotEmpty) {
      await Process.run('python3', [
        kPath,
        'hotkey',
        jsonEncode(keys),
      ]);
    }
  }
}
