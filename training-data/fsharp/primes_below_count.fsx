let countPrimesBelow n =
    if n < 3 then 0
    else
        let composite = Array.zeroCreate<bool> n
        let mutable count = 0
        for i in 2 .. n - 1 do
            if not composite.[i] then
                count <- count + 1
                for j in i * i .. i .. n - 1 do
                    composite.[j] <- true
        count

printfn "%d" (countPrimesBelow 100)
