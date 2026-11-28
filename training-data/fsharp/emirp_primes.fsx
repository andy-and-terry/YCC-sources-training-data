let isPrime n = n >= 2 && Seq.forall (fun i -> n % i <> 0) (seq { 2 .. int (sqrt (float n)) })
let rev (n: int) = n.ToString().ToCharArray() |> Array.rev |> System.String |> int

[ 2 .. 99 ]
|> List.filter (fun p -> isPrime p && rev p <> p && isPrime (rev p))
|> printfn "%A"
