let squares = seq { for n in 1 .. 10 -> n * n }
let evenSquares = seq { for n in 1 .. 10 do if n % 2 = 0 then yield n * n }
let lazyPrimes = Seq.initInfinite (fun i -> i + 2) |> Seq.filter (fun n -> n < 30)

printfn "%A" (Seq.toList squares)
printfn "%A" (Seq.toList evenSquares)
printfn "%A" (lazyPrimes |> Seq.take 5 |> Seq.toList)
