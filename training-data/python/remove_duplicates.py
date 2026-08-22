from typing import List


def remove_duplicates_ordered(items: List[int]) -> List[int]:
    seen = set()
    result = []
    for x in items:
        if x not in seen:
            seen.add(x)
            result.append(x)
    return result


if __name__ == "__main__":
    print(remove_duplicates_ordered([1, 2, 2, 3, 1, 4]))
