import 'dart:convert';
import 'dart:io';
import 'package:dart_autogui/src/utils.dart';

/// Path for keyboard.py script
final kPath = getScriptPath('keyboard.py');

class Keyboard {
  static Future<List<String>> keyboardKeys() async {
    final data = await Process.run('python3', [kPath, 'keys']);
    final keys = jsonDecode(data.stdout.toString()) as List<dynamic>;
    final mapped = keys.map((e) => e.toString()).toList();
    mapped.removeWhere((element) => element.trim() == '');
    return Future.value(mapped);
  }

  static Future<void> typeWord(
    String word, {
    int interval = 0,
  }) async {
    await Process.run('python3', [
      kPath,
      'type_word',
      word.toString(),
      interval.toString(),
    ]);
  }

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
