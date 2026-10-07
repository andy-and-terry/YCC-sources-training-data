local arr = { 10, 20, nil, 40 }
local n = 0
for _ in ipairs(arr) do n = n + 1 end
print("ipairs stops at nil:", n)

local mixed = { 1, 2, 3, x = "a", y = "b" }
local seq, rec = 0, 0
for k in pairs(mixed) do
  if type(k) == "number" then seq = seq + 1 else rec = rec + 1 end
end
print(seq, rec, #mixed)

local function sorted_pairs(t)
  local keys = {}
  for k in pairs(t) do keys[#keys + 1] = k end
  table.sort(keys)
  local i = 0
  return function()
    i = i + 1
    if keys[i] ~= nil then return keys[i], t[keys[i]] end
  end
end

for k, v in sorted_pairs({ banana = 3, apple = 1, cherry = 2 }) do print(k, v) end
for i = 10, 1, -4 do io.write(i, " ") end
print()
