let isPrime n =
    if n < 2 then false
    else
        let limit = int (sqrt (float n))
        not (seq { 2 .. limit } |> Seq.exists (fun i -> n % i = 0))

[ 2 .. 20 ] |> List.filter isPrime |> printfn "%A"
