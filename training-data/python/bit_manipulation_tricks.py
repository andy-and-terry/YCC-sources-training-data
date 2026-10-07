def is_power_of_two(n: int) -> bool:
    return n > 0 and n & (n - 1) == 0


def lowest_set_bit(n: int) -> int:
    return n & -n


def popcount(n: int) -> int:
    count = 0
    while n:
        n &= n - 1
        count += 1
    return count


def single_number(nums: list[int]) -> int:
    """Every value appears twice except one; XOR cancels the pairs."""
    result = 0
    for x in nums:
        result ^= x
    return result


def subsets(items: list[str]) -> list[list[str]]:
    return [[items[i] for i in range(len(items)) if mask >> i & 1]
            for mask in range(1 << len(items))]


if __name__ == "__main__":
    print(is_power_of_two(64), is_power_of_two(60))
    print(lowest_set_bit(40), popcount(255), bin(0b1011 ^ 0b0110))
    print(single_number([4, 1, 2, 1, 2]))
    print(subsets(["a", "b", "c"]))
