int trap(List<int> heights) {
  if (heights.isEmpty) return 0;

  var left = 0, right = heights.length - 1;
  var leftMax = heights[left], rightMax = heights[right];
  var water = 0;

  while (left < right) {
    if (leftMax < rightMax) {
      left++;
      leftMax = leftMax > heights[left] ? leftMax : heights[left];
      water += leftMax - heights[left];
    } else {
      right--;
      rightMax = rightMax > heights[right] ? rightMax : heights[right];
      water += rightMax - heights[right];
    }
  }

  return water;
}

void main() {
  print(trap([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]));
}
