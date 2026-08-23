let rec power baseNum exp =
    if exp = 0 then 1
    elif exp % 2 = 0 then
        let half = power baseNum (exp / 2)
        half * half
    else
        baseNum * power baseNum (exp - 1)

printfn "%d" (power 2 10)
printfn "%d" (power 3 5)
