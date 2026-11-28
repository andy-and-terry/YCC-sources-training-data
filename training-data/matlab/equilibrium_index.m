function idx = equilibrium_index(nums)
  total = sum(nums);
  left = cumsum(nums) - nums;      % sum strictly before each element
  hit = find(left == total - left - nums, 1);
  if isempty(hit)
    idx = -1;
  else
    idx = hit;                     % 1-based
  end
end

disp(equilibrium_index([1 7 3 6 5 6]))  % 4
