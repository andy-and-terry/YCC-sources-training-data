let fact (n: int) = Seq.fold (*) 1I (seq { 1I .. bigint n })
let comb n k = fact n / (fact k * fact (n - k))
let lah n k = comb (n - 1) (k - 1) * fact n / fact k

for n in 1 .. 5 do
    [ for k in 1 .. n -> string (lah n k) ] |> String.concat " " |> printfn "%s"
