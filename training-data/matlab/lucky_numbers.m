% Start with odds, then delete every k-th survivor for each surviving k
limit = 50;
nums = 1:2:limit;
i = 2;
while i <= numel(nums) && nums(i) <= numel(nums)
    step = nums(i);
    nums(step:step:end) = [];
    i = i + 1;
end
disp(strjoin(arrayfun(@num2str, nums, 'UniformOutput', false), ' '))
