local function next_term(s)
  local out, i = {}, 1
  while i <= #s do
    local c = s:sub(i, i)
    local j = i
    while s:sub(j, j) == c do j = j + 1 end
    out[#out + 1] = (j - i) .. c
    i = j
  end
  return table.concat(out)
end

local s = "1"
for _ = 1, 8 do
  print(s)
  s = next_term(s)
end
