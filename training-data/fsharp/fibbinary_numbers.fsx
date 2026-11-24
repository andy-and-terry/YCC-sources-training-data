// Fibbinary numbers: no two adjacent 1 bits.
[ 0 .. 49 ]
|> List.filter (fun n -> n &&& (n >>> 1) = 0)
|> List.map string
|> String.concat " "
|> printfn "%s"
