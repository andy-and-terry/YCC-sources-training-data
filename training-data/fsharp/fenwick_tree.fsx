type Fenwick = { Tree: int[]; Size: int }

let create size = { Tree = Array.zeroCreate (size + 1); Size = size }

let update fenwick index delta =
    let mutable i = index
    while i <= fenwick.Size do
        fenwick.Tree.[i] <- fenwick.Tree.[i] + delta
        i <- i + (i &&& -i)

let prefixSum fenwick index =
    let mutable i = index
    let mutable total = 0
    while i > 0 do
        total <- total + fenwick.Tree.[i]
        i <- i - (i &&& -i)
    total

let rangeSum fenwick l r =
    prefixSum fenwick r - prefixSum fenwick (l - 1)

let fenwick = create 6
[ 3; 2; -1; 6; 5; 4 ] |> List.iteri (fun i v -> update fenwick (i + 1) v)
printfn "%d" (rangeSum fenwick 2 4)
printfn "%d" (rangeSum fenwick 1 6)
