import 'dart:cli';
import 'dart:io';
import 'dart:isolate';

/// The private getPath method, set to handle paths from all 3 Desktop platforms.
/// Returns the relative library location for desktops based on the plugin's location
/// and the binary's relative path
/// Credit -> https://github.com/tmthecoder/
String getScriptPath(String script) {
  final rootLibrary = 'package:dart_autogui/dart_autogui.dart';
  final rootPath = waitFor(Isolate.resolvePackageUri(Uri.parse(rootLibrary)))!
      .resolve('scripts/')
      .toFilePath(windows: Platform.isWindows);

  return '$rootPath$script';
}
