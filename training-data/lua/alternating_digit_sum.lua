local function alternating_digit_sum(n)
  local total, sign = 0, 1
  while n > 0 do
    total = total + sign * (n % 10)
    sign = -sign
    n = n // 10
  end
  return total
end

for _, n in ipairs({1234, 99999, 1000}) do
  print(n, alternating_digit_sum(n))
end
