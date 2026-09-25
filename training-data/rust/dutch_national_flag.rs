// Sorts a slice of 0s, 1s and 2s in a single pass using three pointers,
// without any auxiliary buckets or comparisons beyond the pivot values.
fn dutch_flag_sort(nums: &mut Vec<i32>) {
    if nums.is_empty() {
        return;
    }
    let (mut low, mut mid, mut high) = (0usize, 0usize, nums.len() - 1);

    while mid <= high {
        match nums[mid] {
            0 => {
                nums.swap(low, mid);
                low += 1;
                mid += 1;
            }
            1 => mid += 1,
            2 => {
                nums.swap(mid, high);
                if high == 0 {
                    break;
                }
                high -= 1;
            }
            _ => unreachable!("input must only contain 0, 1 or 2"),
        }
    }
}

fn main() {
    let mut nums = vec![2, 0, 2, 1, 1, 0, 2, 0, 1];
    dutch_flag_sort(&mut nums);
    println!("{:?}", nums);
}
