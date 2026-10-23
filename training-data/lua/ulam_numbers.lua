local function ulam(count)
  local seq = { 1, 2 }
  local candidate = 3
  while #seq < count do
    local ways = 0
    for i = 1, #seq do
      for j = i + 1, #seq do
        if seq[i] + seq[j] == candidate then
          ways = ways + 1
        end
      end
    end
    if ways == 1 then
      seq[#seq + 1] = candidate
    end
    candidate = candidate + 1
  end
  return seq
end

print(table.concat(ulam(15), " "))
