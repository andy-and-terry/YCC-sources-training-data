"""Reservoir sampling: pick k uniformly random items from a stream of
unknown (or too large to hold in memory) length, in a single pass and
using only O(k) extra space."""

import random
from typing import Iterable, List, TypeVar

T = TypeVar("T")


def sample_stream(stream: Iterable[T], k: int, rng: random.Random) -> List[T]:
    reservoir: List[T] = []

    for i, item in enumerate(stream):
        if i < k:
            reservoir.append(item)
        else:
            j = rng.randint(0, i)
            if j < k:
                reservoir[j] = item

    return reservoir


if __name__ == "__main__":
    rng = random.Random(42)
    sample = sample_stream(range(1, 1_000_001), k=5, rng=rng)
    print(sample)

    # Sanity check: over many trials, each item should be chosen with
    # roughly the same frequency (k / n).
    counts = [0] * 10
    for trial in range(20_000):
        trial_rng = random.Random(trial)
        for item in sample_stream(range(10), k=3, rng=trial_rng):
            counts[item] += 1
    print(counts)
