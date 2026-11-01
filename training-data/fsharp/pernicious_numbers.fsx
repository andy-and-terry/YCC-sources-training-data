// Pernicious numbers: the popcount is prime.
let isPrime n =
    n >= 2 && Seq.forall (fun d -> n % d <> 0) (Seq.takeWhile (fun d -> d * d <= n) (Seq.initInfinite ((+) 2)))

let popcount (n: int) = System.Numerics.BitOperations.PopCount(uint32 n)

[ 1 .. 20 ]
|> List.filter (popcount >> isPrime)
|> List.map string
|> String.concat " "
|> printfn "%s"
