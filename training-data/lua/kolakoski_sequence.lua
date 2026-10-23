local function kolakoski(count)
  local seq = { 1, 2, 2 }
  local i = 3
  while #seq < count do
    local value = (i % 2 == 1) and 1 or 2
    for _ = 1, seq[i] do
      seq[#seq + 1] = value
    end
    i = i + 1
  end
  return { table.unpack(seq, 1, count) }
end

print(table.concat(kolakoski(20), " "))
