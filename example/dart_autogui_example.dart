import 'package:dart_autogui/dart_autogui.dart';

Future<void> pos() async {
  final position = await Mouse.pos();
  print("X: ${position.x} , Y: ${position.y}");
}

Future<void> moveTo() async {
  await Mouse.moveTo(
    x: 100,
    y: 100,
    duration: Duration(seconds: 5),
    tween: MouseTween.easeInElastic,
  );
}

Future<void> moveRel() async {
  await Mouse.moveRel(
    x: 100,
    y: 100,
    duration: Duration(seconds: 5),
  );
}

void main() async {
  await moveRel();
}
