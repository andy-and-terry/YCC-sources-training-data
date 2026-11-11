// Centered square numbers 2n(n+1)+1
let term n = ((2 * n) * (n + 1)) + 1

[ 0 .. 9 ] |> List.map term |> List.map string |> String.concat " " |> printfn "%s"
