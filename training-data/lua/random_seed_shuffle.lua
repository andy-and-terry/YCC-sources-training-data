math.randomseed(12345)

local function shuffle(t)
  for i = #t, 2, -1 do
    local j = math.random(i)
    t[i], t[j] = t[j], t[i]
  end
  return t
end

local deck = {}
for i = 1, 10 do deck[i] = i end
shuffle(deck)

local sum = 0
for _, v in ipairs(deck) do sum = sum + v end
print(#deck, sum)
