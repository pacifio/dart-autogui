import json
import sys
import pyautogui as auto


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

        if tween == "linear":
            tween_func = auto.linear
        elif tween == "ease-in":
            tween_func = auto.easeInQuad
        elif tween == "ease-out":
            tween_func = auto.easeOutQuad
        elif tween == "ease-in-out":
            tween_func = auto.easeInOutQuad
        elif tween == 'bounce':
            tween_func = auto.easeInBounce
        elif tween == "elastic":
            tween_func = auto.easeInElastic

        auto.moveTo(x=x, y=y, duration=duration, tween=tween_func)

    @staticmethod
    def move_rel(x: int = 0, y: int = 0, duration: int = 0) -> None:
        auto.moveRel(xOffset=x, yOffset=y, duration=duration)

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

    else:
        print(Mouse.default())
