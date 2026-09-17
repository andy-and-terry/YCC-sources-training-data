let rec siftDown (arr: int[]) root heapSize =
    let left = 2 * root + 1
    let right = 2 * root + 2
    let mutable largest = root

    if left < heapSize && arr.[left] > arr.[largest] then
        largest <- left
    if right < heapSize && arr.[right] > arr.[largest] then
        largest <- right

    if largest <> root then
        let temp = arr.[root]
        arr.[root] <- arr.[largest]
        arr.[largest] <- temp
        siftDown arr largest heapSize

let heapSort (arr: int[]) =
    let n = arr.Length
    for i in (n / 2 - 1) .. -1 .. 0 do
        siftDown arr i n
    for endIdx in (n - 1) .. -1 .. 1 do
        let temp = arr.[0]
        arr.[0] <- arr.[endIdx]
        arr.[endIdx] <- temp
        siftDown arr 0 endIdx
    arr

let data = [| 8; 3; 5; 1; 9; 2; 7; 4 |]
printfn "%A" (heapSort data)
