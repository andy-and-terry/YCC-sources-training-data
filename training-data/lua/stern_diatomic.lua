local function stern(count)
  local seq = { [0] = 0, [1] = 1 }
  for i = 2, count - 1 do
    local h = i // 2
    seq[i] = (i % 2 == 0) and seq[h] or (seq[h] + seq[h + 1])
  end
  return seq
end

local seq, out = stern(15), {}
for i = 0, 14 do out[#out + 1] = seq[i] end
print(table.concat(out, " ")) -- 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3
