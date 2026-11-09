from concurrent.futures import ThreadPoolExecutor


def work(n: int) -> int:
    return n * n


with ThreadPoolExecutor(max_workers=4) as ex:
    print(list(ex.map(work, range(8))))
