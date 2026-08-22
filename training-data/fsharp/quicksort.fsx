let rec quicksort items =
    match items with
    | [] -> []
    | pivot :: rest ->
        let smaller = rest |> List.filter (fun x -> x < pivot)
        let larger = rest |> List.filter (fun x -> x >= pivot)
        quicksort smaller @ [ pivot ] @ quicksort larger

printfn "%A" (quicksort [ 5; 3; 8; 1; 9; 2 ])
