let isPrime n =
    n >= 2 && Seq.initInfinite (fun i -> i + 2) |> Seq.takeWhile (fun d -> d * d <= n) |> Seq.forall (fun d -> n % d <> 0)

let pairs = [ for p in 3 .. 78 do if isPrime p && isPrime (p + 2) then yield sprintf "(%d,%d)" p (p + 2) ]
printfn "%s" (String.concat " " pairs) // (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
