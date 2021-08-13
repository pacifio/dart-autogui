def validate() -> bool:
    try:
        import pyautogui as _
        return True
    except ImportError:
        return False
