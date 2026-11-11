// Population count (number of set bits) for 0..15
let rec bits n = if n = 0 then 0 else (n &&& 1) + bits (n >>> 1)

[ 0 .. 15 ] |> List.map bits |> List.map string |> String.concat " " |> printfn "%s"
