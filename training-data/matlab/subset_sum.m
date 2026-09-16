function found = subset_sum(nums, target)
    n = numel(nums);
    dp = false(n + 1, target + 1);
    dp(:, 1) = true;
    for i = 1:n
        for t = 1:target
            dp(i + 1, t + 1) = dp(i, t + 1);
            if nums(i) <= t
                dp(i + 1, t + 1) = dp(i + 1, t + 1) || dp(i, t - nums(i) + 1);
            end
        end
    end
    found = dp(n + 1, target + 1);
end

disp(subset_sum([3, 34, 4, 12, 5, 2], 9))
disp(subset_sum([1, 2, 3], 7))
