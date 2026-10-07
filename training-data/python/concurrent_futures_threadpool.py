"""concurrent.futures.ThreadPoolExecutor: run blocking I/O-bound work
concurrently and collect results as they complete."""

import time
from concurrent.futures import ThreadPoolExecutor, as_completed


def fetch(url: str) -> str:
    time.sleep(0.01 * len(url))  # simulate network latency
    return f"body of {url}"


def fetch_all(urls: list[str], max_workers: int = 4) -> dict[str, str]:
    results: dict[str, str] = {}
    with ThreadPoolExecutor(max_workers=max_workers) as pool:
        future_to_url = {pool.submit(fetch, url): url for url in urls}
        for future in as_completed(future_to_url):
            url = future_to_url[future]
            results[url] = future.result()
    return results


if __name__ == "__main__":
    urls = ["a.com", "bb.com", "ccc.com", "dddd.com"]
    results = fetch_all(urls)
    for url in urls:
        print(url, "->", results[url])
