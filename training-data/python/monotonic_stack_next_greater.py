"""A monotonic stack keeps its elements in sorted order at all times
by popping whatever would break that order before pushing -- here used
to find, for each element, the next element to its right that is
strictly greater."""

from typing import List


def next_greater_elements(nums: List[int]) -> List[int]:
    result = [-1] * len(nums)
    stack: List[int] = []  # indices whose "next greater" is still unknown

    for i, num in enumerate(nums):
        while stack and nums[stack[-1]] < num:
            result[stack.pop()] = num
        stack.append(i)

    return result


def daily_temperatures(temperatures: List[int]) -> List[int]:
    """How many days until a warmer temperature, for each day (0 if none)."""
    result = [0] * len(temperatures)
    stack: List[int] = []

    for i, temp in enumerate(temperatures):
        while stack and temperatures[stack[-1]] < temp:
            prev = stack.pop()
            result[prev] = i - prev
        stack.append(i)

    return result


if __name__ == "__main__":
    print(next_greater_elements([2, 1, 2, 4, 3]))
    print(daily_temperatures([73, 74, 75, 71, 69, 72, 76, 73]))
