let sigma n = [ 1 .. n ] |> List.filter (fun d -> n % d = 0) |> List.sum

printfn "%A" ([ 1 .. 20 ] |> List.filter (fun n -> sigma n < 2 * n))
