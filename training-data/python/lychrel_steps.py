# Reverse-and-add until a palindrome appears; count the steps needed.
def steps(n, limit=100):
    for count in range(limit):
        if str(n) == str(n)[::-1] and count > 0:
            return count
        n += int(str(n)[::-1])
    return None

print(*[steps(n) for n in (56, 57, 59, 79, 89)])
