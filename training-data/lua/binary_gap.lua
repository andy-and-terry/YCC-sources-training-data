local function binary_gap(n)
  local best, last, i = 0, nil, 0
  while n > 0 do
    if n & 1 == 1 then
      if last then best = math.max(best, i - last - 1) end
      last = i
    end
    n = n >> 1
    i = i + 1
  end
  return best
end

for _, n in ipairs({ 9, 529, 20, 15, 1041 }) do print(n, binary_gap(n)) end
