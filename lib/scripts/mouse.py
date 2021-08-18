import json
import sys
import pyautogui as auto


def map_tween(tween):
    if tween == "linear":
        return auto.linear
    elif tween == "ease-in":
        return auto.easeInQuad
    elif tween == "ease-out":
        return auto.easeOutQuad
    elif tween == "ease-in-out":
        return auto.easeInOutQuad
    elif tween == 'bounce':
        return auto.easeInBounce
    elif tween == "elastic":
        return auto.easeInElastic
    else:
        return auto.linear


class Mouse:

    @staticmethod
    def get_mouse_pos() -> tuple:
        x, y = auto.position()
        data = {
            'x': x,
            'y': y
        }
        return json.dumps(data)

    @staticmethod
    def move_to(x: int = 0, y: int = 0, duration: int = 0, tween: str = "linear") -> None:
        tween_func = map_tween(tween)
        auto.moveTo(x=x, y=y, duration=duration, tween=tween_func)

    @staticmethod
    def move_rel(x: int = 0, y: int = 0, duration: int = 0) -> None:
        auto.moveRel(xOffset=x, yOffset=y, duration=duration)

    @staticmethod
    def drag_to(x: int = 0, y: int = 0, duration: int = 0, tween: str = "linear", button: str = "left") -> None:
        tween_func = map_tween(tween)
        auto.dragTo(x, y, duration, tween_func, button)

    @staticmethod
    def drag_rel(x: int = 0, y: int = 0, duration: int = 0, tween: str = "linear", button: str = "left") -> None:
        tween_func = map_tween(tween)
        auto.dragTo(x, y, duration, tween_func, button)

    @staticmethod
    def click(x: int = 0, y: int = 0, clicks: int = 1, interval: int = 0, button: str = "left", duration: int = 0, tween: str = "linear"):
        tween_func = map_tween(tween)
        auto.click(x, y, clicks, interval, button, duration, tween_func)

    @staticmethod
    def default(): return json.dumps({})


if __name__ == "__main__":
    arg = sys.argv
    command = arg[1]

    if command == "pos":
        print(Mouse.get_mouse_pos())
    elif command == "move_to":
        x, y, dur, tween = arg[2], arg[3], arg[4], arg[5]
        Mouse.move_to(int(x), int(y), int(dur), str(tween))
    elif command == "move_rel":
        x, y, dur = arg[2], arg[3], arg[4]
        Mouse.move_rel(int(x), int(y), int(dur))
    elif command == "drag_to":
        x, y, dur, tween, button = arg[2], arg[3], arg[4], arg[5], arg[6]
        Mouse.drag_to(int(x), int(y), int(dur), str(tween), str(button))
    elif command == "drag_rel":
        x, y, dur, tween, button = arg[2], arg[3], arg[4], arg[5], arg[6]
        Mouse.drag_rel(int(x), int(y), int(dur), str(tween), str(button))
    elif command == "click":
        x, y, clicks, interval, button, duration, tween = arg[
            2], arg[3], arg[4], arg[5], arg[6], arg[7], arg[8]
        Mouse.click(int(x), int(y), int(clicks), int(interval),
                    str(button), int(duration), str(tween))

    else:
        print(Mouse.default())
