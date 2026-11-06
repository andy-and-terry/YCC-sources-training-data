"""Bulls and Cows scoring for equal-length digit strings."""


def score(secret, guess):
    bulls = sum(s == g for s, g in zip(secret, guess))
    common = sum(min(secret.count(c), guess.count(c)) for c in set(guess))
    return bulls, common - bulls


bulls, cows = score("1807", "7810")
print(f"{bulls} bull(s), {cows} cow(s)")
