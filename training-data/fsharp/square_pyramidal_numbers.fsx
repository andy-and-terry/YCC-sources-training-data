// Square pyramidal numbers n(n+1)(2n+1)/6
let term n = ((n * (n + 1)) * ((2 * n) + 1))/6

[ 0 .. 9 ] |> List.map term |> List.map string |> String.concat " " |> printfn "%s"
