local function polygonal(sides, n)
  return ((sides - 2) * n * n - (sides - 4) * n) // 2
end

local shapes = { { "Triangular", 3 }, { "Pentagonal", 5 }, { "Hexagonal", 6 } }
for _, shape in ipairs(shapes) do
  local nums = {}
  for n = 1, 10 do
    nums[n] = polygonal(shape[2], n)
  end
  print(shape[1] .. ": " .. table.concat(nums, " "))
end
