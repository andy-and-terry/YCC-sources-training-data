local function my_power(base, exp)
  if exp == 0 then return 1 end
  if exp % 2 == 0 then
    local half = my_power(base, exp // 2)
    return half * half
  end
  return base * my_power(base, exp - 1)
end

print(my_power(2, 10))
print(my_power(3, 5))
