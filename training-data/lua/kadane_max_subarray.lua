local function max_subarray(a)
  local best, cur = a[1], a[1]
  for i = 2, #a do
    cur = math.max(a[i], cur + a[i])
    best = math.max(best, cur)
  end
  return best
end

print(max_subarray({ -2, 1, -3, 4, -1, 2, 1, -5, 4 }))
print(max_subarray({ -3, -1, -2 }))
print(max_subarray({ 1, 2, 3 }))
