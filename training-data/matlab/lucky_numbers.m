% Lucky numbers below 100: start with the odd numbers, then delete every
% k-th survivor, where k is the next surviving number
nums = 1:2:99;
idx = 2;
while idx <= numel(nums) && nums(idx) <= numel(nums)
    k = nums(idx);
    nums(k:k:end) = [];
    idx = idx + 1;
end
disp(nums)
