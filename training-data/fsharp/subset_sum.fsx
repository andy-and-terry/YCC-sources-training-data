let hasSubsetSum (nums: int list) target =
    let dp = Array.create (target + 1) false
    dp.[0] <- true

    for num in nums do
        for s in target .. -1 .. num do
            if dp.[s - num] then dp.[s] <- true

    dp.[target]

printfn "%b" (hasSubsetSum [ 3; 34; 4; 12; 5; 2 ] 9)
printfn "%b" (hasSubsetSum [ 3; 34; 4; 12; 5; 2 ] 10)
