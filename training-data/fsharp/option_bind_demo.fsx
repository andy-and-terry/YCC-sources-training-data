let tryParse (s: string) =
    match System.Int32.TryParse s with
    | true, v -> Some v
    | _ -> None

let r = tryParse "21" |> Option.map (fun x -> x * 2) |> Option.defaultValue 0
printfn "%d" r
