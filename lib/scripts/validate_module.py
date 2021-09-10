def installed() -> bool:
    try:
        import pyautogui as _
        return True
    except ImportError:
        return False


if __name__ == "__main__":
    print(installed())
