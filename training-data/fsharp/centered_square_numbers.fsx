// Centered square numbers: n^2 + (n+1)^2.
[ 0 .. 9 ] |> List.map (fun n -> n * n + (n + 1) * (n + 1) |> string) |> String.concat " " |> printfn "%s"
