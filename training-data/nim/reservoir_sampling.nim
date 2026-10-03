import random

proc reservoirSample(stream: seq[int], k: int): seq[int] =
  result = stream[0 ..< k]
  for i in k ..< stream.len:
    let j = rand(0 .. i)
    if j < k:
      result[j] = stream[i]

randomize(7)
let stream = @[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
echo reservoirSample(stream, 3)
