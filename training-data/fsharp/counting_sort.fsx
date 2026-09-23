let countingSort (values: int[]) =
    if values.Length = 0 then
        [||]
    else
        let maxVal = Array.max values
        let counts = Array.zeroCreate (maxVal + 1)
        for v in values do
            counts.[v] <- counts.[v] + 1
        [| for v in 0 .. maxVal do
               for _ in 1 .. counts.[v] -> v |]

printfn "%A" (countingSort [| 4; 2; 2; 8; 3; 3; 1 |])
