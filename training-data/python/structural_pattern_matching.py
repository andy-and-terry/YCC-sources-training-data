def classify(command):
    match command.split():
        case ["move", direction] if direction in {"north", "south", "east", "west"}:
            return f"moving {direction}"
        case ["attack", target]:
            return f"attacking {target}"
        case ["quit"]:
            return "quitting"
        case _:
            return "unknown command"


def process_readings(readings):
    results = []
    for value in readings:
        if (doubled := value * 2) > 10:
            results.append(doubled)
    return results


if __name__ == "__main__":
    for cmd in ["move north", "attack dragon", "quit", "dance"]:
        print(classify(cmd))
    print(process_readings([1, 6, 3, 8]))
