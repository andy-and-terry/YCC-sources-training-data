let a = [| 5; 3; 8; 1; 9; 2; 7; 4; 6; 0; 3; 5 |]
let bs = 4
let blk = a |> Array.chunkBySize bs |> Array.map Array.sum

let query l r =
    let rec go i acc =
        if i > r then acc
        elif i % bs = 0 && i + bs - 1 <= r then go (i + bs) (acc + blk.[i / bs])
        else go (i + 1) (acc + a.[i])
    go l 0

printfn "%d" (query 2 9)
