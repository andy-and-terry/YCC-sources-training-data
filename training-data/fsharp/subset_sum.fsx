let subsetSum (nums: int list) (target: int) =
    let dp = Array.create (target + 1) false
    dp.[0] <- true
    for num in nums do
        for t in target .. -1 .. num do
            if dp.[t - num] then
                dp.[t] <- true
    dp.[target]

printfn "%b" (subsetSum [ 3; 34; 4; 12; 5; 2 ] 9)
printfn "%b" (subsetSum [ 3; 34; 4; 12; 5; 2 ] 61)
