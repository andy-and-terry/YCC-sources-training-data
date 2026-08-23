local function sum_all(...)
  local total = 0
  for _, v in ipairs({ ... }) do
    total = total + v
  end
  return total
end

print(sum_all(1, 2, 3, 4, 5))
