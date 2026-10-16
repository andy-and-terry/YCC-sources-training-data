let nums = [ 1 .. 10 ]

let evens, odds = List.partition (fun n -> n % 2 = 0) nums
printfn "%A | %A" evens odds

let parsed =
    [ "1"; "x"; "3"; "four"; "5" ]
    |> List.choose (fun s ->
        match System.Int32.TryParse s with
        | true, v -> Some v
        | _ -> None)

printfn "%A" parsed

printfn "%A" (List.tryFind (fun n -> n > 7) nums)
printfn "%A" (List.tryFindIndex (fun n -> n > 7) nums)
printfn "%A" (List.pick (fun n -> if n * n > 50 then Some n else None) nums)
