type Shape =
    | Circle of radius: float
    | Rectangle of width: float * height: float
    | Triangle of baseLength: float * height: float

let area shape =
    match shape with
    | Circle r -> System.Math.PI * r * r
    | Rectangle(w, h) -> w * h
    | Triangle(b, h) -> 0.5 * b * h

[ Circle 2.0; Rectangle(3.0, 4.0); Triangle(6.0, 2.0) ]
|> List.map area
|> printfn "%A"
