let shellSort (arr: int[]) =
    let a = Array.copy arr
    let n = a.Length
    let mutable gap = n / 2
    while gap > 0 do
        for i in gap .. n - 1 do
            let temp = a.[i]
            let mutable j = i
            while j >= gap && a.[j - gap] > temp do
                a.[j] <- a.[j - gap]
                j <- j - gap
            a.[j] <- temp
        gap <- gap / 2
    a

printfn "%A" (shellSort [| 9; 5; 1; 4; 3; 8; 2; 7 |])
