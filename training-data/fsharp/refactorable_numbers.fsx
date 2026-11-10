let tau n = [ 1 .. n ] |> List.filter (fun d -> n % d = 0) |> List.length

let result = [ 1 .. 59 ] |> List.filter (fun n -> n % tau n = 0)
printfn "%s" (result |> List.map string |> String.concat " ") // 1 2 8 9 12 18 24 36 40 56
