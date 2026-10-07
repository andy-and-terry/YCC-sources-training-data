def combination_sum(candidates, target):
    candidates = sorted(candidates)
    out = []

    def backtrack(start, remaining, path):
        if remaining == 0:
            out.append(path[:])
            return
        for i in range(start, len(candidates)):
            c = candidates[i]
            if c > remaining:
                break
            path.append(c)
            backtrack(i, remaining - c, path)
            path.pop()

    backtrack(0, target, [])
    return out


if __name__ == "__main__":
    print(combination_sum([2, 3, 6, 7], 7))
    print(combination_sum([2, 3, 5], 8))
