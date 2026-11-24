// Hexagonal numbers: n(2n-1).
[ 1 .. 10 ] |> List.map (fun n -> n * (2 * n - 1) |> string) |> String.concat " " |> printfn "%s"
