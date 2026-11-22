// Emirps: primes whose digit reversal is a different prime.
let isPrime n =
    n >= 2 && Seq.forall (fun d -> n % d <> 0) (Seq.takeWhile (fun d -> d * d <= n) (Seq.initInfinite (fun i -> i + 2)))

let reverse (n: int) = int (System.String(Array.rev ((string n).ToCharArray())))

[ 2 .. 199 ]
|> List.filter (fun n -> let r = reverse n in r <> n && isPrime n && isPrime r)
|> List.map string |> String.concat " " |> printfn "%s"
