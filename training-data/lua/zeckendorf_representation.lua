local function zeckendorf(n)
  local fibs = { 1, 2 }
  while fibs[#fibs] <= n do
    fibs[#fibs + 1] = fibs[#fibs] + fibs[#fibs - 1]
  end
  local parts = {}
  for i = #fibs, 1, -1 do
    if fibs[i] <= n then
      parts[#parts + 1] = fibs[i]
      n = n - fibs[i]
    end
  end
  return parts
end

print(table.concat(zeckendorf(100), " "))
