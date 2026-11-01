// Positive n expressible as a*a + b*b with a, b >= 0.
let representable n =
    seq { 0 .. n }
    |> Seq.takeWhile (fun a -> a * a <= n)
    |> Seq.exists (fun a ->
        let b = int (round (sqrt (float (n - a * a))))
        a * a + b * b = n)

[ 1 .. 30 ] |> List.filter representable |> List.map string |> String.concat " " |> printfn "%s"
