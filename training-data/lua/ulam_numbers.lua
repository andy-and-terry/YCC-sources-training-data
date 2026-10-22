local function ulam(count)
  local seq = { 1, 2 }
  local member = { [1] = true, [2] = true }
  local n = 3
  while #seq < count do
    local ways = 0
    for _, a in ipairs(seq) do
      local b = n - a
      if b > a and member[b] then
        ways = ways + 1
      end
    end
    if ways == 1 then
      seq[#seq + 1] = n
      member[n] = true
    end
    n = n + 1
  end
  return seq
end

print(table.concat(ulam(15), " "))
