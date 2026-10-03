proc ternarySearch(arr: seq[int], target: int): int =
  var lo = 0
  var hi = arr.len - 1
  while lo <= hi:
    let third = (hi - lo) div 3
    let m1 = lo + third
    let m2 = hi - third
    if arr[m1] == target:
      return m1
    if arr[m2] == target:
      return m2
    if target < arr[m1]:
      hi = m1 - 1
    elif target > arr[m2]:
      lo = m2 + 1
    else:
      lo = m1 + 1
      hi = m2 - 1
  result = -1

let arr = @[1, 3, 5, 7, 9, 11, 13, 15]
echo ternarySearch(arr, 9)
echo ternarySearch(arr, 4)
