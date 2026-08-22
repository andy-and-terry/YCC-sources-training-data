let bubbleSort (arr: int[]) =
    let a = Array.copy arr
    for i in 0 .. a.Length - 1 do
        for j in 0 .. a.Length - i - 2 do
            if a.[j] > a.[j + 1] then
                let temp = a.[j]
                a.[j] <- a.[j + 1]
                a.[j + 1] <- temp
    a

printfn "%A" (bubbleSort [| 5; 2; 9; 1; 5; 6 |])
