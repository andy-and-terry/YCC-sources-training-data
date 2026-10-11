import std/algorithm

let xs = @[1, 3, 3, 5, 7, 9]
echo xs.binarySearch(5)
echo xs.binarySearch(4)
echo xs.lowerBound(3)
echo xs.upperBound(3)
echo xs.isSorted
echo xs.reversed
echo xs.rotatedLeft(2)
var ys = @[3, 1, 2]
ys.sort(Descending)
echo ys
echo ys.sortedByIt(-it)
