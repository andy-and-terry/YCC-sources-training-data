local function expand_around_center(s, left, right)
  while left >= 1 and right <= #s and s:sub(left, left) == s:sub(right, right) do
    left = left - 1
    right = right + 1
  end
  -- the loop overshoots by one step on both sides
  return left + 1, right - 1
end

local function longest_palindromic_substring(s)
  if #s == 0 then
    return ""
  end

  local best_start, best_end = 1, 1
  for i = 1, #s do
    local l1, r1 = expand_around_center(s, i, i)
    if r1 - l1 > best_end - best_start then
      best_start, best_end = l1, r1
    end

    local l2, r2 = expand_around_center(s, i, i + 1)
    if r2 - l2 > best_end - best_start then
      best_start, best_end = l2, r2
    end
  end

  return s:sub(best_start, best_end)
end

print(longest_palindromic_substring("babad"))
print(longest_palindromic_substring("cbbd"))
print(longest_palindromic_substring("a"))
