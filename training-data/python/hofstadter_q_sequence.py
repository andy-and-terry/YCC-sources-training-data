def hofstadter_q(count: int) -> list[int]:
    # Q(n) = Q(n - Q(n - 1)) + Q(n - Q(n - 2)), with Q(1) = Q(2) = 1
    q = [0, 1, 1]
    for n in range(3, count + 1):
        q.append(q[n - q[n - 1]] + q[n - q[n - 2]])
    return q[1:]


if __name__ == "__main__":
    print(" ".join(map(str, hofstadter_q(20))))
