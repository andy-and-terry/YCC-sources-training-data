local function fibonacci(n)
  local result = {}
  local a, b = 0, 1
  for i = 1, n do
    table.insert(result, a)
    a, b = b, a + b
  end
  return result
end

print(table.concat(fibonacci(11), " "))
