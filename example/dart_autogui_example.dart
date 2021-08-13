import 'package:dart_autogui/dart_autogui.dart';

Future<void> pos() async {
  final position = await Mouse.getPosition();
  print("X: ${position.x} , Y: ${position.y}");
}

Future<void> move() async {
  await Mouse.move(x: 100, y: 100, duration: Duration(seconds: 5));
}

void main() async {
  await move();
}
