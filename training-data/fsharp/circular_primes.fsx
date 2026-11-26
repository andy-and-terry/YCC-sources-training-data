// Circular primes below 100; expect 13.
let isPrime n =
    n > 1 && Seq.forall (fun d -> n % d <> 0) (seq { 2 .. int (sqrt (float n)) })

let circular (n: int) =
    let s = string n
    [ 0 .. s.Length - 1 ] |> List.forall (fun i -> isPrime (int (s.Substring i + s.Substring(0, i))))
printfn "%d" ([ 2 .. 99 ] |> List.filter circular |> List.length)
