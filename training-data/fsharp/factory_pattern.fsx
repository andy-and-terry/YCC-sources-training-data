type Shape =
    | Circle of float
    | Square of float

let area shape =
    match shape with
    | Circle r -> System.Math.PI * r * r
    | Square s -> s * s

let createShape kind size =
    match kind with
    | "circle" -> Circle size
    | "square" -> Square size
    | _ -> failwith "unknown shape"

let shapes = [ createShape "circle" 2.0; createShape "square" 3.0 ]
shapes |> List.iter (fun s -> printfn "%.2f" (area s))
