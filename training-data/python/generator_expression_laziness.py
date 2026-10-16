import sys

squares_list = [n * n for n in range(100_000)]
squares_gen = (n * n for n in range(100_000))
print(sys.getsizeof(squares_list) > sys.getsizeof(squares_gen))

print(sum(n * n for n in range(10)))
print(any(n > 5 for n in range(10)), all(n < 5 for n in range(10)))

gen = (x for x in "abc")
print(next(gen), list(gen), list(gen))  # exhausted after one pass

first_even = next((n for n in [1, 3, 6, 7] if n % 2 == 0), None)
print(first_even)
