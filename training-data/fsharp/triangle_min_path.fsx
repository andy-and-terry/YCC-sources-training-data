let minimumTotal (triangle: int list list) =
    let rows = List.rev triangle
    let step below row =
        row |> List.mapi (fun i v -> v + min (List.item i below) (List.item (i + 1) below))
    List.fold step (List.head rows) (List.tail rows) |> List.head

printfn "%d" (minimumTotal [ [ 2 ]; [ 3; 4 ]; [ 6; 5; 7 ]; [ 4; 1; 8; 3 ] ]) // 11
