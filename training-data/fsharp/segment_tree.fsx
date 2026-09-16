let build (values: int[]) =
    let n = values.Length
    let tree = Array.zeroCreate (4 * max n 1)
    let rec buildHelp node lo hi =
        if lo = hi then
            tree.[node] <- values.[lo]
        else
            let mid = (lo + hi) / 2
            buildHelp (2 * node) lo mid
            buildHelp (2 * node + 1) (mid + 1) hi
            tree.[node] <- tree.[2 * node] + tree.[2 * node + 1]
    if n > 0 then buildHelp 1 0 (n - 1)
    tree

let rec query (tree: int[]) node lo hi l r =
    if r < lo || hi < l then 0
    elif l <= lo && hi <= r then tree.[node]
    else
        let mid = (lo + hi) / 2
        query tree (2 * node) lo mid l r + query tree (2 * node + 1) (mid + 1) hi l r

let rangeSum (values: int[]) l r =
    let tree = build values
    query tree 1 0 (values.Length - 1) l r

let values = [| 1; 3; 5; 7; 9; 11 |]
printfn "%d" (rangeSum values 1 3)
printfn "%d" (rangeSum values 0 5)
