let isPrime n = n > 1 && Seq.forall (fun d -> n % d <> 0) (seq { 2 .. int (sqrt (float n)) })

let primes = [ 2 .. 50 ] |> List.filter isPrime
let twins = primes |> List.pairwise |> List.filter (fun (a, b) -> b - a = 2)
printfn "%A" twins
