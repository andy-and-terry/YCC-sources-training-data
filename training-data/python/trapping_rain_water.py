from typing import List


def trap_rain_water(heights: List[int]) -> int:
    """Two-pointer solution: water above index i is bounded by the smaller
    of the tallest wall to its left and to its right."""
    if not heights:
        return 0
    left, right = 0, len(heights) - 1
    left_max, right_max = heights[left], heights[right]
    trapped = 0
    while left < right:
        if left_max <= right_max:
            left += 1
            left_max = max(left_max, heights[left])
            trapped += left_max - heights[left]
        else:
            right -= 1
            right_max = max(right_max, heights[right])
            trapped += right_max - heights[right]
    return trapped


if __name__ == "__main__":
    print(trap_rain_water([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]))
    print(trap_rain_water([4, 2, 0, 3, 2, 5]))
