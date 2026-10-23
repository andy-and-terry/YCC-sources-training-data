local function kaprekar_steps(n)
  local steps = 0
  while n ~= 6174 do
    local d = {}
    for ch in string.format("%04d", n):gmatch(".") do d[#d + 1] = ch end
    table.sort(d)
    local asc = tonumber(table.concat(d))
    local desc = tonumber(table.concat(d):reverse())
    n = desc - asc
    steps = steps + 1
  end
  return steps
end

print(kaprekar_steps(3524))
