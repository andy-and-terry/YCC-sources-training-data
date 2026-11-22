// Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
[ 0 .. 9 ] |> List.map (fun n -> n * (n + 1) / 2 + 1) |> List.map string |> String.concat " " |> printfn "%s"
