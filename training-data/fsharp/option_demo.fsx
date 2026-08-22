let safeDivide a b =
    if b = 0 then None else Some(a / b)

[ (10, 2); (5, 0); (9, 3) ]
|> List.iter (fun (a, b) ->
    match safeDivide a b with
    | Some v -> printfn "%d / %d = %d" a b v
    | None -> printfn "%d / %d = undefined" a b)

[ Some 1; None; Some 3 ] |> List.choose id |> List.sum |> printfn "%d"
