let isPrime n =
    n >= 2 && Seq.forall (fun d -> n % d <> 0) (seq { 2 .. int (sqrt (float n)) })

let rev (n: int) = string n |> Seq.rev |> Seq.toArray |> System.String |> int

[ 2 .. 199 ]
|> List.filter (fun p -> rev p <> p && isPrime p && isPrime (rev p))
|> printfn "%A" // [13; 17; 31; 37; 71; 73; 79; 97; 107; 113; 149; 157; 167; 179; 199]
