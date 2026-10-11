proc total(xs: openArray[int]): int =
  for x in xs: result += x

let arr = [1, 2, 3, 4, 5]
let sq = @[10, 20, 30]
echo total(arr)
echo total(sq)
echo total(arr[1 .. 3])
echo total(sq[0 ..< 2])
echo arr[^1], " ", arr[^2]
echo arr[1 .. ^2]
