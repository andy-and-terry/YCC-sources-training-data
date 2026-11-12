def run():
    raise ExceptionGroup("multi", [ValueError("v"), TypeError("t")])

try:
    run()
except* ValueError as eg:
    print("value", [str(e) for e in eg.exceptions])
except* TypeError as eg:
    print("type", [str(e) for e in eg.exceptions])
