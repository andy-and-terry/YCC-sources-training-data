[<Struct>]
type Point =
    { X: float
      Y: float }
    member p.Length = sqrt (p.X * p.X + p.Y * p.Y)

[<Struct>]
type Shape =
    | Circle of radius: float
    | Square of side: float

let area shape =
    match shape with
    | Circle r -> System.Math.PI * r * r
    | Square s -> s * s

let p = { X = 3.0; Y = 4.0 }
printfn "%f" p.Length

let struct (a, b) = struct (1, "two")
printfn "%d %s" a b

printfn "%.2f %.2f" (area (Circle 1.0)) (area (Square 2.0))
printfn "%b" (p = { X = 3.0; Y = 4.0 })
