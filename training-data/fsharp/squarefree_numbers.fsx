// Squarefree numbers up to 100; expect 61.
let squarefree n =
    seq { 2 .. int (sqrt (float n)) } |> Seq.forall (fun d -> n % (d * d) <> 0)
printfn "%d" ([ 1 .. 100 ] |> List.filter squarefree |> List.length)
