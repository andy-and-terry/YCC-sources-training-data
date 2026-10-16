import random

rng = random.Random(42)
print([rng.randint(1, 6) for _ in range(5)])
print(rng.choice("abcdef"))
print(rng.sample(range(100), 4))
deck = list(range(10))
rng.shuffle(deck)
print(deck)
print(rng.choices(["H", "T"], weights=[3, 1], k=8))
print(round(rng.random(), 4), round(rng.uniform(1, 2), 4))
print(round(rng.gauss(0, 1), 4))

# same seed -> same sequence
a = random.Random(7)
b = random.Random(7)
print(a.random() == b.random())
state = rng.getstate()
x = rng.random()
rng.setstate(state)
print(x == rng.random())
