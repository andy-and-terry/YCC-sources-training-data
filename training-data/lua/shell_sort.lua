local function shell_sort(items)
  local arr = {}
  for i, v in ipairs(items) do arr[i] = v end
  local n = #arr
  local gap = math.floor(n / 2)
  while gap > 0 do
    for i = gap + 1, n do
      local temp = arr[i]
      local j = i
      while j > gap and arr[j - gap] > temp do
        arr[j] = arr[j - gap]
        j = j - gap
      end
      arr[j] = temp
    end
    gap = math.floor(gap / 2)
  end
  return arr
end

print(table.concat(shell_sort({ 12, 34, 54, 2, 3 }), " "))
