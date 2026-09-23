let longestIncreasingSubsequence (nums: int[]) =
    let n = nums.Length
    let lengths = Array.create n 1

    for i in 1 .. n - 1 do
        for j in 0 .. i - 1 do
            if nums.[j] < nums.[i] then
                lengths.[i] <- max lengths.[i] (lengths.[j] + 1)

    Array.max lengths

printfn "%d" (longestIncreasingSubsequence [| 10; 9; 2; 5; 3; 7; 101; 18 |])
