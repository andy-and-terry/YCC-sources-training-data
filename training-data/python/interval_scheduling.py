def max_non_overlapping(intervals):
    chosen, end = [], float("-inf")
    for s, e in sorted(intervals, key=lambda iv: iv[1]):
        if s >= end:
            chosen.append((s, e))
            end = e
    return chosen


def min_rooms(intervals):
    events = sorted([(s, 1) for s, _ in intervals] + [(e, -1) for _, e in intervals])
    cur = best = 0
    for _, delta in events:
        cur += delta
        best = max(best, cur)
    return best


if __name__ == "__main__":
    meetings = [(1, 4), (3, 5), (0, 6), (5, 7), (3, 9), (5, 9), (6, 10), (8, 11), (8, 12), (2, 14), (12, 16)]
    print(max_non_overlapping(meetings))
    print("rooms needed:", min_rooms(meetings))
