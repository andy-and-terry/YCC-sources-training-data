local function kadane(items)
  local best = items[1]
  local current = items[1]
  for i = 2, #items do
    current = math.max(items[i], current + items[i])
    best = math.max(best, current)
  end
  return best
end

print(kadane({ -2, 1, -3, 4, -1, 2, 1, -5, 4 }))
