// Primorials up to 1e6, including 1; expect 8.
let isPrime n =
    n > 1 && Seq.forall (fun d -> n % d <> 0) (seq { 2 .. int (sqrt (float n)) })

let values =
    Seq.initInfinite ((+) 2)
    |> Seq.filter isPrime
    |> Seq.scan (fun acc p -> acc * p) 1L
    |> Seq.takeWhile (fun v -> v <= 1000000L)
    |> List.ofSeq
printfn "%d %A" values.Length values
