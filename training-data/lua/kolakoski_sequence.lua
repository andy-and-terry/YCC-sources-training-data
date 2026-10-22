local function kolakoski(count)
  local seq = { 1, 2, 2 }
  local i = 3
  while #seq < count do
    local value = 3 - seq[#seq]
    for _ = 1, seq[i] do
      seq[#seq + 1] = value
    end
    i = i + 1
  end
  return table.move(seq, 1, count, 1, {})
end

print(table.concat(kolakoski(20), " "))
