let rec selectionSort items =
    match items with
    | [] -> []
    | _ ->
        let minVal = List.min items
        minVal :: selectionSort (List.except [ minVal ] items |> fun rest ->
            let idx = List.findIndex ((=) minVal) items
            List.mapi (fun i x -> i, x) items
            |> List.filter (fun (i, _) -> i <> idx)
            |> List.map snd)

printfn "%A" (selectionSort [ 5; 3; 8; 1; 9; 2 ])
