let find key m = Map.tryFind key m

let prices = Map [ "apple", 3; "pear", 5 ]

printfn "%d" (find "apple" prices |> Option.defaultValue 0)
printfn "%d" (find "kiwi" prices |> Option.defaultValue 0)

let fallback = find "kiwi" prices |> Option.orElse (find "pear" prices)
printfn "%A" fallback

let lazyDefault = find "kiwi" prices |> Option.defaultWith (fun () -> printfn "computing default"; -1)
printfn "%d" lazyDefault

printfn "%A" (Some 5 |> Option.filter (fun x -> x > 10))
printfn "%A" (Some 4 |> Option.map ((*) 2) |> Option.bind (fun x -> if x > 5 then Some x else None))
printfn "%b %b" (Option.isSome (Some 1)) (Option.isNone (Some 1))
