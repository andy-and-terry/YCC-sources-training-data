let sigma n = [ 1 .. n ] |> List.filter (fun d -> n % d = 0) |> List.sum

let result = [ 1 .. 99 ] |> List.filter (fun n -> sigma (sigma n) = 2 * n)
printfn "%s" (result |> List.map string |> String.concat " ") // 2 4 16 64
