"""heapq beyond a plain priority queue: merging sorted streams lazily and
selecting the n largest/smallest items by a key."""

import heapq


def merge_logs(*streams):
    """Each stream is a sorted list of (timestamp, message)."""
    return list(heapq.merge(*streams))


if __name__ == "__main__":
    a = [(1, "boot"), (5, "login"), (9, "logout")]
    b = [(2, "ping"), (6, "query")]
    c = [(3, "gc"), (10, "halt")]
    for ts, msg in merge_logs(a, b, c):
        print(ts, msg)

    products = [
        {"name": "pen", "price": 2},
        {"name": "lamp", "price": 30},
        {"name": "desk", "price": 150},
        {"name": "mug", "price": 8},
    ]
    print([p["name"] for p in heapq.nlargest(2, products, key=lambda p: p["price"])])
    print([p["name"] for p in heapq.nsmallest(2, products, key=lambda p: p["price"])])
