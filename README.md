# Dart Autogui

Dart autogui is a wrapper around python `autogui` module . You need python , `pyautogui` and `pyscreeze` installed in your computer for this package to work .

## Install

Python packages to install

```bash
pip3 install pyautogui pyscreeze
```

Dart install

```yaml
dependencies:
  dart_autogui: 0.0.1
```

Validate your `dart_autogui` installation

```dart
print(await Validate.installed());
// Returns true if all dependencies are installed
// false if dependencies are not resolved
```

## Functions

Mouse functions

```dart
getPosition() ✅
moveTo() ✅
moveRel() ✅
dragTo() ✅
dragRel() ✅
click() ✅
rightClick() ✅
middleClick() ✅
doubleClick() ✅
tripleClick() ✅
scroll()
mouseDown()
mouseUp()
onLeftClick()
onRightClick()
```

Keyboard functions

```dart
keyboardKeys() ✅
typeWord() ✅
hotKey() ✅
```

## Example

```dart
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
```
