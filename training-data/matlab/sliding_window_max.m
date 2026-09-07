function result = sliding_window_max(nums, k)
    n = numel(nums);
    result = zeros(1, n - k + 1);
    deque = [];
    for i = 1:n
        while ~isempty(deque) && deque(1) <= i - k
            deque(1) = [];
        end
        while ~isempty(deque) && nums(deque(end)) <= nums(i)
            deque(end) = [];
        end
        deque(end + 1) = i;
        if i >= k
            result(i - k + 1) = nums(deque(1));
        end
    end
end

nums = [1, 3, -1, -3, 5, 3, 6, 7];
disp(sliding_window_max(nums, 3))
