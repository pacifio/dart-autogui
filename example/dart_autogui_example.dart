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

Future<void> dragTo() async {
  await Mouse.dragTo(
    x: 100,
    y: 100,
    duration: Duration(seconds: 5),
    tween: MouseTween.easeInElastic,
    button: MouseButton.right,
  );
}

Future<void> dragRel() async {
  await Mouse.dragRel(
    x: 100,
    y: 100,
    duration: Duration(seconds: 2),
    tween: MouseTween.easeInElastic,
  );
}

Future<void> rightClick() async {
  await Mouse.rightClick(
      x: 100, y: 100, clicks: 5, tween: MouseTween.easeInQuad);
}

Future<void> keyboardKeys() async {
  final data = await Keyboard.keyboardKeys();
  data.forEach((element) {
    print(element);
  });
}

Future<void> typeWord() async {
  await Keyboard.typeWord('Adib Mohsin', interval: 0);
}

Future<void> hotkey() async {
  await Keyboard.hotKey(['ctrl', 'v']);
}

Future<void> validateInstall() async {
  print(await Validate.installed());
}

void main() async {
  validateInstall();
}
