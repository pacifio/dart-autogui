import json
import sys
import pyautogui as auto


class Keyboard:
    @staticmethod
    def get_keys():
        return json.dumps(auto.KEYBOARD_KEYS)

    @staticmethod
    def type_word(word: str = "", interval: int = 0):
        auto.typewrite(word, interval)

    @staticmethod
    def hotkey(data: str = ""):
        auto.hotkey(*json.loads(data))

    @staticmethod
    def default(): return json.dumps({})


if __name__ == "__main__":
    arg = sys.argv
    command = arg[1]

    if command == "keys":
        print(Keyboard.get_keys())
    elif command == "type_word":
        word, interval = str(arg[2]), int(arg[3])
        Keyboard.type_word(word, interval)
    elif command == "hotkey":
        Keyboard.hotkey(str(arg[2]))
    else:
        print(Keyboard.default())
