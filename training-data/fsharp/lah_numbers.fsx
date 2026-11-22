// Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
let rec fact (n: int) : int64 = if n <= 1 then 1L else int64 n * fact (n - 1)
let comb n k = fact n / (fact k * fact (n - k))

let n = 5
[ 1 .. n ] |> List.map (fun k -> comb (n - 1) (k - 1) * fact n / fact k) |> List.map string |> String.concat " " |> printfn "%s"
