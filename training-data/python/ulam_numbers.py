def ulam(count: int) -> list[int]:
    terms = [1, 2]
    members = {1, 2}
    cand = 2
    while len(terms) < count:
        cand += 1
        ways = sum(1 for a in terms if a < cand - a and (cand - a) in members)
        if ways == 1:
            terms.append(cand)
            members.add(cand)
    return terms


if __name__ == "__main__":
    print(" ".join(map(str, ulam(15))))
