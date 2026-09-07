function best = lis_length(nums)
    n = numel(nums);
    dp = ones(1, n);
    for i = 2:n
        for j = 1:i-1
            if nums(j) < nums(i) && dp(j) + 1 > dp(i)
                dp(i) = dp(j) + 1;
            end
        end
    end
    if n == 0
        best = 0;
    else
        best = max(dp);
    end
end

nums = [10, 9, 2, 5, 3, 7, 101, 18];
disp(lis_length(nums))
