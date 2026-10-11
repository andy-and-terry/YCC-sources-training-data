local t = { 1, 2, 3 }
t[5] = 5
local count = 0
for _ in pairs(t) do count = count + 1 end
print("pairs count", count)

-- explicit length tracking avoids relying on the border of #
local list = { n = 0 }
local function push(l, v)
  l.n = l.n + 1
  l[l.n] = v
end
push(list, "a"); push(list, nil); push(list, "c")
print(list.n)
print(select("#", nil, nil))
print(select("#", table.unpack({ n = 3 }, 1, 3)))
