# Merge overlapping closed intervals after sorting by start.
def merge_intervals(intervals):
    merged = []
    for start, end in sorted(intervals):
        if merged and start <= merged[-1][1]:
            merged[-1][1] = max(merged[-1][1], end)
        else:
            merged.append([start, end])
    return merged

if __name__ == "__main__":
    print(merge_intervals([(8, 10), (1, 3), (2, 6), (15, 18), (17, 20)]))
    # [[1, 6], [8, 10], [15, 20]]
