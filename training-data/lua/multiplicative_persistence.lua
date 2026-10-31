local function persistence(n)
  local steps = 0
  while n >= 10 do
    local product = 1
    while n > 0 do
      product = product * (n % 10)
      n = n // 10
    end
    n = product
    steps = steps + 1
  end
  return steps
end

for _, n in ipairs({39, 77, 999, 10}) do
  print(n, persistence(n))
end
