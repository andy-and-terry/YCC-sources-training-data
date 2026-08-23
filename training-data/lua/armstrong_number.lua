local function is_armstrong(n)
  local digits_str = tostring(n)
  local power = #digits_str
  local total = 0
  for i = 1, #digits_str do
    local d = tonumber(digits_str:sub(i, i))
    total = total + d ^ power
  end
  return total == n
end

print(is_armstrong(153))
print(is_armstrong(154))
