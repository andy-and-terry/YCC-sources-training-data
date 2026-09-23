-- Fractional knapsack: unlike the 0/1 version, items can be split, so
-- the greedy choice (highest value-per-weight first) is optimal.
local function fractional_knapsack(items, capacity)
  local sorted = {}
  for i, item in ipairs(items) do sorted[i] = item end
  table.sort(sorted, function(a, b)
    return (a.value / a.weight) > (b.value / b.weight)
  end)

  local total_value = 0
  local remaining = capacity

  for _, item in ipairs(sorted) do
    if remaining <= 0 then break end
    if item.weight <= remaining then
      total_value = total_value + item.value
      remaining = remaining - item.weight
    else
      total_value = total_value + item.value * (remaining / item.weight)
      remaining = 0
    end
  end

  return total_value
end

local items = {
  { weight = 10, value = 60 },
  { weight = 20, value = 100 },
  { weight = 30, value = 120 },
}

print(fractional_knapsack(items, 50))
print(fractional_knapsack(items, 10))
