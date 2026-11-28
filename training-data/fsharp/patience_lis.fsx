let lisLength (a: int list) =
    a
    |> List.fold (fun (tails: int list) x ->
        match List.tryFindIndex (fun t -> t >= x) tails with
        | Some i -> tails |> List.mapi (fun j t -> if j = i then x else t)
        | None -> tails @ [ x ]) []
    |> List.length

printfn "%d" (lisLength [ 10; 9; 2; 5; 3; 7; 101; 18 ])
