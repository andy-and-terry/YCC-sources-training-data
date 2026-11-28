type Shape =
    | Circle of float
    | Rect of float * float

let area = function
    | Circle r -> System.Math.PI * r * r
    | Rect (w, h) -> w * h

[ Circle 1.0; Rect(2.0, 3.0) ] |> List.iter (area >> printfn "%.2f")
