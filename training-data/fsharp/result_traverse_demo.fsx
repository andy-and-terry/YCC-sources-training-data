let parse (s: string) =
    match System.Int32.TryParse s with
    | true, v -> Ok v
    | _ -> Error(sprintf "bad number: %s" s)

// turn a list of results into a result of a list; stop at first error
let traverse f xs =
    let folder x acc =
        match f x, acc with
        | Ok v, Ok vs -> Ok(v :: vs)
        | Error e, _ -> Error e
        | _, Error e -> Error e
    List.foldBack folder xs (Ok [])

printfn "%A" (traverse parse [ "1"; "2"; "3" ])
printfn "%A" (traverse parse [ "1"; "x"; "3"; "y" ])
printfn "%A" (Result.map (List.sum) (traverse parse [ "10"; "20" ]))
printfn "%A" (Result.defaultValue [] (traverse parse [ "q" ]))
