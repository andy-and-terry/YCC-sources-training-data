type
  SortStrategy = proc (data: seq[int]): seq[int]

proc bubbleSort(data: seq[int]): seq[int] =
  result = data
  for i in 0 ..< result.len:
    for j in 0 ..< result.len - i - 1:
      if result[j] > result[j + 1]:
        swap(result[j], result[j + 1])

proc insertionSort(data: seq[int]): seq[int] =
  result = data
  for i in 1 ..< result.len:
    let key = result[i]
    var j = i - 1
    while j >= 0 and result[j] > key:
      result[j + 1] = result[j]
      dec j
    result[j + 1] = key

type
  Sorter = object
    strategy: SortStrategy

proc newSorter(strategy: SortStrategy): Sorter =
  Sorter(strategy: strategy)

proc sort(s: Sorter, data: seq[int]): seq[int] =
  s.strategy(data)

let data = @[5, 2, 8, 1, 9, 3]
let bubbleSorter = newSorter(bubbleSort)
let insertionSorter = newSorter(insertionSort)
echo sort(bubbleSorter, data)
echo sort(insertionSorter, data)
