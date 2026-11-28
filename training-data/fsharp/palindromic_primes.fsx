let isPrime n =
    n >= 2 && Seq.forall (fun d -> n % d <> 0) (seq { 2 .. int (sqrt (float n)) })

let isPalindrome (n: int) =
    let s = string n
    s = (s |> Seq.rev |> Seq.toArray |> System.String)

[ 2 .. 199 ] |> List.filter (fun n -> isPalindrome n && isPrime n) |> printfn "%A"
// [2; 3; 5; 7; 11; 101; 131; 151; 181; 191]
