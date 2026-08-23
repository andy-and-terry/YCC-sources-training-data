let kadane (items: int list) =
    let h = List.head items
    let t = List.tail items
    let best, _ =
        t |> List.fold
            (fun (best, current) x ->
                let newCurrent = max x (current + x)
                max best newCurrent, newCurrent)
            (h, h)
    best

printfn "%d" (kadane [ -2; 1; -3; 4; -1; 2; 1; -5; 4 ])
