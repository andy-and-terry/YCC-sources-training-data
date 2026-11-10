let isPrime n =
    n >= 2L && Seq.initInfinite (fun i -> int64 i + 2L) |> Seq.takeWhile (fun d -> d * d <= n) |> Seq.forall (fun d -> n % d <> 0L)

let rev (n: int64) = int64 (System.String(Array.rev ((string n).ToCharArray())))

let emirps =
    Seq.initInfinite (fun i -> int64 i + 2L)
    |> Seq.filter (fun n -> let r = rev n in r <> n && isPrime n && isPrime r)
    |> Seq.take 10

printfn "%s" (emirps |> Seq.map string |> String.concat " ") // 13 17 31 37 71 73 79 97 107 113
