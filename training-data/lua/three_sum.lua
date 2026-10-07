local function three_sum(nums)
  local sorted = { table.unpack(nums) }
  table.sort(sorted)
  local n = #sorted
  local result = {}

  for i = 1, n - 2 do
    if i == 1 or sorted[i] ~= sorted[i - 1] then
      local left, right = i + 1, n
      while left < right do
        local sum = sorted[i] + sorted[left] + sorted[right]
        if sum < 0 then
          left = left + 1
        elseif sum > 0 then
          right = right - 1
        else
          table.insert(result, { sorted[i], sorted[left], sorted[right] })
          while left < right and sorted[left] == sorted[left + 1] do left = left + 1 end
          while left < right and sorted[right] == sorted[right - 1] do right = right - 1 end
          left = left + 1
          right = right - 1
        end
      end
    end
  end
  return result
end

local triples = three_sum({ -1, 0, 1, 2, -1, -4 })
for _, t in ipairs(triples) do
  print(t[1], t[2], t[3])
end
