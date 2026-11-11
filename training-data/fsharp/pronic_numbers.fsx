// Pronic numbers n(n+1)
let term n = n * (n + 1)

[ 0 .. 9 ] |> List.map term |> List.map string |> String.concat " " |> printfn "%s"
