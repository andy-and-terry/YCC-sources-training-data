// Tetrahedral numbers n(n+1)(n+2)/6
let term n = ((n * (n + 1)) * (n + 2))/6

[ 0 .. 9 ] |> List.map term |> List.map string |> String.concat " " |> printfn "%s"
