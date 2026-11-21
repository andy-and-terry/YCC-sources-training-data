// Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
let isBouncy (n: int) =
    let d = string n |> List.ofSeq
    d <> List.sort d && d <> List.sortDescending d

[ 1 .. 999 ] |> List.filter isBouncy |> List.length |> printfn "%d"
