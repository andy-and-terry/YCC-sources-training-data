from concurrent.futures import ThreadPoolExecutor, as_completed


def square(n):
    return n, n * n


if __name__ == "__main__":
    with ThreadPoolExecutor(max_workers=3) as ex:
        futures = [ex.submit(square, i) for i in range(5)]
        for f in as_completed(futures):
            print(f.result())
