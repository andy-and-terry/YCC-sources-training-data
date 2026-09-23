type Shape =
    | Circle of float
    | Square of float

let makeShape kind (size: float) =
    match kind with
    | "circle" -> Circle size
    | "square" -> Square size
    | other -> failwithf "unknown shape: %s" other

let area shape =
    match shape with
    | Circle r -> System.Math.PI * r * r
    | Square s -> s * s

printfn "%f" (area (makeShape "circle" 2.0))
printfn "%f" (area (makeShape "square" 3.0))
