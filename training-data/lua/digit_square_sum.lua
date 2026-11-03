local function digit_square_sum(n)
  n = math.abs(n)
  local sum = 0
  while n > 0 do
    local d = n % 10
    sum = sum + d * d
    n = n // 10
  end
  return sum
end

print(digit_square_sum(123))
print(digit_square_sum(-99))
