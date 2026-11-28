local function lis_length(a)
  local tails = {}
  for _, x in ipairs(a) do
    local lo, hi = 1, #tails + 1
    while lo < hi do
      local mid = (lo + hi) // 2
      if tails[mid] < x then lo = mid + 1 else hi = mid end
    end
    tails[lo] = x
  end
  return #tails
end

print(lis_length({ 10, 9, 2, 5, 3, 7, 101, 18 }))
