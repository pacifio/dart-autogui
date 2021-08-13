import json
import sys
import pyautogui as auto


class MouseData:

    @staticmethod
    def get_mouse_pos() -> tuple:
        x, y = auto.mouseinfo.position()
        data = {
            'x': x,
            'y': y
        }
        return json.dumps(data)

    @staticmethod
    def default(): return json.dumps({})


if __name__ == "__main__":
    arg = sys.argv
    if arg[1] == "pos":
        print(MouseData.get_mouse_pos())
    else:
        print(MouseData.default())
