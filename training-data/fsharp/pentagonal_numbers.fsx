// Pentagonal numbers: n(3n-1)/2.
[ 1 .. 10 ] |> List.map (fun n -> n * (3 * n - 1) / 2 |> string) |> String.concat " " |> printfn "%s"
