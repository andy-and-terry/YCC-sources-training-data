let parse (s: string) =
    match System.Int32.TryParse s with
    | true, n -> Some n
    | _ -> None

let result =
    parse "21"
    |> Option.map (fun n -> n * 2)
    |> Option.bind (fun n -> if n > 40 then Some (string n) else None)

printfn "%A" result
