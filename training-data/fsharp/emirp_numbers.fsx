// Emirps: primes whose digit reversal is a different prime.
let isPrime n =
    n >= 2 && Seq.forall (fun i -> n % i <> 0) (seq { 2 .. int (sqrt (float n)) })

let reverse (n: int) = n |> string |> Seq.rev |> Seq.toArray |> System.String |> int

let emirps =
    [ 2 .. 99 ] |> List.filter (fun n -> reverse n <> n && isPrime n && isPrime (reverse n))

printfn "%A" emirps
