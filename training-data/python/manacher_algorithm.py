def longest_palindromic_substring(s):
    if not s:
        return ""

    transformed = "#" + "#".join(s) + "#"
    n = len(transformed)
    radius = [0] * n
    center = right = 0
    best_center = best_radius = 0

    for i in range(n):
        if i < right:
            radius[i] = min(right - i, radius[2 * center - i])
        while (
            i - radius[i] - 1 >= 0
            and i + radius[i] + 1 < n
            and transformed[i - radius[i] - 1] == transformed[i + radius[i] + 1]
        ):
            radius[i] += 1
        if i + radius[i] > right:
            center, right = i, i + radius[i]
        if radius[i] > best_radius:
            best_center, best_radius = i, radius[i]

    start = (best_center - best_radius) // 2
    return s[start:start + best_radius]


if __name__ == "__main__":
    print(longest_palindromic_substring("babad"))
    print(longest_palindromic_substring("cbbd"))
    print(longest_palindromic_substring("forgeeksskeegfor"))
