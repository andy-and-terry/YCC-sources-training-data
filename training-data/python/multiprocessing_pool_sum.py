from multiprocessing import Pool


def chunk_sum(rng):
    return sum(rng)


if __name__ == "__main__":
    chunks = [range(i, i + 1000) for i in range(0, 4000, 1000)]
    with Pool(2) as p:
        print(sum(p.map(chunk_sum, chunks)))
