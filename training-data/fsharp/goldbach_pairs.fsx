// Goldbach partitions of 100; expect 6.
let isPrime n =
    n > 1 && Seq.forall (fun d -> n % d <> 0) (seq { 2 .. int (sqrt (float n)) })

let pairs = [ for p in 2 .. 50 do if isPrime p && isPrime (100 - p) then yield (p, 100 - p) ]
printfn "%d %A" pairs.Length pairs
