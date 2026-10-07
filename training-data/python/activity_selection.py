from typing import List, Tuple


def activity_selection(activities: List[Tuple[int, int]]) -> List[Tuple[int, int]]:
    """Greedy interval scheduling: pick the max number of non-overlapping
    activities, sorted by end time."""
    ordered = sorted(activities, key=lambda pair: pair[1])
    selected = []
    last_end = float("-inf")
    for start, end in ordered:
        if start >= last_end:
            selected.append((start, end))
            last_end = end
    return selected


if __name__ == "__main__":
    acts = [(1, 4), (3, 5), (0, 6), (5, 7), (3, 9), (5, 9), (6, 10), (8, 11), (8, 12), (2, 14), (12, 16)]
    print(activity_selection(acts))
