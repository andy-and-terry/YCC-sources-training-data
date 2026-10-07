from multiprocessing import Pool


def square(n):
    return n * n


def is_even(n):
    return n % 2 == 0


if __name__ == "__main__":
    with Pool(processes=2) as pool:
        print(pool.map(square, range(8)))
        print(list(pool.imap(square, range(4))))
        print(pool.starmap(pow, [(2, 3), (3, 2), (5, 0)]))
        result = pool.apply_async(square, (12,))
        print(result.get(timeout=5))
