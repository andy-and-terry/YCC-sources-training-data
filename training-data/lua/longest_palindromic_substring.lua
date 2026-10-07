local function expand_around_center(s, left, right)
  while left >= 1 and right <= #s and s:sub(left, left) == s:sub(right, right) do
    left = left - 1
    right = right + 1
  end
  return left + 1, right - 1
end

local function longest_palindrome(s)
  local best_start, best_len = 1, 0

  for i = 1, #s do
    local l1, r1 = expand_around_center(s, i, i)
    if r1 - l1 + 1 > best_len then
      best_start, best_len = l1, r1 - l1 + 1
    end

    local l2, r2 = expand_around_center(s, i, i + 1)
    if r2 - l2 + 1 > best_len then
      best_start, best_len = l2, r2 - l2 + 1
    end
  end

  return s:sub(best_start, best_start + best_len - 1)
end

print(longest_palindrome("babad"))
print(longest_palindrome("cbbd"))
print(longest_palindrome("forgeeksskeegfor"))
