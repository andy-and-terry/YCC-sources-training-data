local function digit_sum(n)
  local total = 0
  local num = n
  while num > 0 do
    total = total + num % 10
    num = num // 10
  end
  return total
end

print(digit_sum(12345))
