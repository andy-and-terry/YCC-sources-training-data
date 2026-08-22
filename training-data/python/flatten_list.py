from typing import Any, List


def flatten(items: List[Any]) -> List[Any]:
    result = []
    for item in items:
        if isinstance(item, list):
            result.extend(flatten(item))
        else:
            result.append(item)
    return result


if __name__ == "__main__":
    print(flatten([1, [2, 3, [4, [5, 6]], 7]]))
