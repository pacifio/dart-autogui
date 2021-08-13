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
    def move_to(x: int = 0, y: int = 0, duration: int = 0) -> None:
        auto.moveTo(x=x, y=y, duration=duration)

    @staticmethod
    def default(): return json.dumps({})


if __name__ == "__main__":
    arg = sys.argv
    command = arg[1]

    if command == "pos":
        print(Mouse.get_mouse_pos())
    elif command == "move":
        x, y, dur = arg[2], arg[3], arg[4]
        Mouse.move_to(int(x), int(y), int(dur))

    else:
        print(Mouse.default())
