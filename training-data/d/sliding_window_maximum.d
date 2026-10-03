import std.stdio;
import std.container : DList;

int[] maxSlidingWindow(int[] nums, int k) {
    int[] result;
    DList!int deque;

    foreach (i, num; nums) {
        while (!deque.empty && deque.back < num) deque.removeBack();
        deque.insertBack(num);

        if (i >= k && nums[i - k] == deque.front) deque.removeFront();
        if (i >= k - 1) result ~= deque.front;
    }

    return result;
}

void main() {
    int[] nums = [1, 3, -1, -3, 5, 3, 6, 7];
    writeln(maxSlidingWindow(nums, 3));
}
