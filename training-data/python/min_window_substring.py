from collections import Counter


def min_window(s, t):
    need = Counter(t)
    missing = len(t)
    left = 0
    best = (0, float("inf"))
    for right, c in enumerate(s, 1):
        if need[c] > 0:
            missing -= 1
        need[c] -= 1
        if missing == 0:
            while need[s[left]] < 0:
                need[s[left]] += 1
                left += 1
            if right - left < best[1] - best[0]:
                best = (left, right)
            need[s[left]] += 1
            missing += 1
            left += 1
    return "" if best[1] == float("inf") else s[best[0]:best[1]]


if __name__ == "__main__":
    print(min_window("ADOBECODEBANC", "ABC"))
    print(repr(min_window("a", "aa")))
