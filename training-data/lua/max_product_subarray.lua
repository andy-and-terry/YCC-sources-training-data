local function max_product(nums)
  local best, hi, lo = nums[1], nums[1], nums[1]
  for i = 2, #nums do
    local x = nums[i]
    if x < 0 then hi, lo = lo, hi end
    hi = math.max(x, hi * x)
    lo = math.min(x, lo * x)
    best = math.max(best, hi)
  end
  return best
end

print(max_product({ 2, 3, -2, 4 }), max_product({ -2, 0, -1 }), max_product({ -2, 3, -4 }))
