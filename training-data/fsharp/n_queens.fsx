let rec solve queens n =
    if List.length queens = n then [ List.rev queens ]
    else
        [ for col in 0 .. n - 1 do
            let safe =
                queens
                |> List.mapi (fun i q -> q, i + 1)
                |> List.forall (fun (q, dist) -> q <> col && abs (q - col) <> dist)
            if safe then yield! solve (col :: queens) n ]

printfn "%d" (List.length (solve [] 6))
