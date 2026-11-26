// Emirps below 200; expect 15.
let isPrime n =
    n > 1 && Seq.forall (fun d -> n % d <> 0) (seq { 2 .. int (sqrt (float n)) })

let rev (n: int) = n.ToString().ToCharArray() |> Array.rev |> System.String |> int
let found = [ 2 .. 199 ] |> List.filter (fun n -> rev n <> n && isPrime n && isPrime (rev n))
printfn "%d %A" found.Length found
