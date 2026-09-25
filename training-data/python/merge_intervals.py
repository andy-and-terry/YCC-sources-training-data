from typing import List, Tuple


def merge_intervals(intervals: List[Tuple[int, int]]) -> List[Tuple[int, int]]:
    if not intervals:
        return []

    ordered = sorted(intervals, key=lambda pair: pair[0])
    merged = [ordered[0]]

    for start, end in ordered[1:]:
        last_start, last_end = merged[-1]
        if start <= last_end:
            merged[-1] = (last_start, max(last_end, end))
        else:
            merged.append((start, end))

    return merged


if __name__ == "__main__":
    print(merge_intervals([(1, 3), (2, 6), (8, 10), (15, 18)]))
    print(merge_intervals([(1, 4), (4, 5)]))
    print(merge_intervals([]))
