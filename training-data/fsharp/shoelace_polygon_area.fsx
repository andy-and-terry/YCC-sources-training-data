let area (pts: (float * float) list) =
    let shifted = List.tail pts @ [ List.head pts ]
    List.map2 (fun (x1, y1) (x2, y2) -> x1 * y2 - x2 * y1) pts shifted
    |> List.sum
    |> abs
    |> fun s -> s / 2.0

printfn "%f" (area [ (0.0, 0.0); (4.0, 0.0); (4.0, 3.0); (0.0, 3.0) ])
