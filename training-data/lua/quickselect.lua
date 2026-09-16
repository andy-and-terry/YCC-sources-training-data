local function partition(arr, lo, hi)
  local pivot = arr[hi]
  local i = lo
  for j = lo, hi - 1 do
    if arr[j] < pivot then
      arr[i], arr[j] = arr[j], arr[i]
      i = i + 1
    end
  end
  arr[i], arr[hi] = arr[hi], arr[i]
  return i
end

local function quickselect(arr, lo, hi, k)
  if lo == hi then return arr[lo] end
  local pivot_index = partition(arr, lo, hi)
  if k == pivot_index then
    return arr[k]
  elseif k < pivot_index then
    return quickselect(arr, lo, pivot_index - 1, k)
  else
    return quickselect(arr, pivot_index + 1, hi, k)
  end
end

local function kth_smallest(arr, k)
  local copy = {}
  for i, v in ipairs(arr) do copy[i] = v end
  return quickselect(copy, 1, #copy, k)
end

local nums = { 7, 10, 4, 3, 20, 15 }
print(kth_smallest(nums, 3))
print(kth_smallest(nums, 1))
