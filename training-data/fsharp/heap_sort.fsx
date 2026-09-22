let siftDown (arr: int[]) (n: int) (root: int) =
    let mutable cur = root
    let mutable go = true
    while go do
        let mutable largest = cur
        let left = 2 * cur + 1
        let right = 2 * cur + 2
        if left < n && arr.[left] > arr.[largest] then largest <- left
        if right < n && arr.[right] > arr.[largest] then largest <- right
        if largest = cur then
            go <- false
        else
            let temp = arr.[cur]
            arr.[cur] <- arr.[largest]
            arr.[largest] <- temp
            cur <- largest

let heapSort (arr: int[]) =
    let n = arr.Length
    for i in n / 2 - 1 .. -1 .. 0 do
        siftDown arr n i
    for i in n - 1 .. -1 .. 1 do
        let temp = arr.[0]
        arr.[0] <- arr.[i]
        arr.[i] <- temp
        siftDown arr i 0

let arr = [| 6; 3; 8; 1; 9; 2 |]
heapSort arr
printfn "%A" arr
