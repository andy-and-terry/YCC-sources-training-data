def quickselect(nums : Array(Int32), k : Int32) : Int32
  list = nums.dup
  select_kth(list, 0, list.size - 1, list.size - k)
end

private def select_kth(list : Array(Int32), left : Int32, right : Int32, target_index : Int32) : Int32
  return list[left] if left == right

  pivot = list[right]
  store_index = left
  (left...right).each do |i|
    if list[i] < pivot
      list[store_index], list[i] = list[i], list[store_index]
      store_index += 1
    end
  end
  list[store_index], list[right] = list[right], list[store_index]

  if store_index == target_index
    list[store_index]
  elsif store_index < target_index
    select_kth(list, store_index + 1, right, target_index)
  else
    select_kth(list, left, store_index - 1, target_index)
  end
end

nums = [3, 2, 1, 5, 6, 4]
puts quickselect(nums, 2)
puts quickselect([3, 2, 3, 1, 2, 4, 5, 5, 6], 4)
