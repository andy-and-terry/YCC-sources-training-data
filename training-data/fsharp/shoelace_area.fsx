let area (pts: (float * float) list) =
    let arr = Array.ofList pts
    let n = arr.Length
    [ for i in 0 .. n - 1 ->
        let x1, y1 = arr.[i]
        let x2, y2 = arr.[(i + 1) % n]
        x1 * y2 - x2 * y1 ]
    |> List.sum |> abs |> fun s -> s / 2.0

printfn "%g" (area [ (0.0, 0.0); (4.0, 0.0); (4.0, 3.0); (0.0, 3.0) ])
