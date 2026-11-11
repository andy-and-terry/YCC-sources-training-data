// Lazy caterer sequence: max pieces from n cuts
let term n = ((n * (n + 1))/2) + 1

[ 0 .. 9 ] |> List.map term |> List.map string |> String.concat " " |> printfn "%s"
