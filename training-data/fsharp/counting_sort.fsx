let countingSort (arr: int[]) =
    if arr.Length = 0 then
        arr
    else
        let maxVal = Array.max arr
        let counts = Array.zeroCreate (maxVal + 1)
        for x in arr do
            counts.[x] <- counts.[x] + 1
        for i in 1 .. maxVal do
            counts.[i] <- counts.[i] + counts.[i - 1]
        let result = Array.zeroCreate arr.Length
        for i in arr.Length - 1 .. -1 .. 0 do
            let x = arr.[i]
            counts.[x] <- counts.[x] - 1
            result.[counts.[x]] <- x
        result

printfn "%A" (countingSort [| 4; 2; 2; 8; 3; 3; 1 |])
