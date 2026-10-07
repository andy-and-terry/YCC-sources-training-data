// Two-pointer solution: water above each bar is bounded by the smaller of
// the tallest walls seen so far from the left and from the right.
fn trap(height: &[i32]) -> i32 {
    if height.is_empty() {
        return 0;
    }
    let (mut left, mut right) = (0usize, height.len() - 1);
    let (mut left_max, mut right_max) = (0, 0);
    let mut water = 0;

    while left < right {
        if height[left] <= height[right] {
            left_max = left_max.max(height[left]);
            water += left_max - height[left];
            left += 1;
        } else {
            right_max = right_max.max(height[right]);
            water += right_max - height[right];
            right -= 1;
        }
    }
    water
}

fn main() {
    let height = vec![0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1];
    println!("{}", trap(&height));
}
