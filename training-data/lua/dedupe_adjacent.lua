-- Collapse consecutive duplicate characters.
local function dedupe(s)
  local out, prev = {}, nil
  for c in s:gmatch(".") do
    if c ~= prev then out[#out + 1] = c end
    prev = c
  end
  return table.concat(out)
end
print(dedupe("aabbbcdd"))
