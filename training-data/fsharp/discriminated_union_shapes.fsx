type Shape =
    | Circle of float
    | Rectangle of float * float
    | Triangle of float * float * float

let area shape =
    match shape with
    | Circle r -> System.Math.PI * r * r
    | Rectangle(w, h) -> w * h
    | Triangle(a, b, c) ->
        let s = (a + b + c) / 2.0
        sqrt (s * (s - a) * (s - b) * (s - c))

printfn "%f" (area (Circle 4.0))
printfn "%f" (area (Rectangle(3.0, 5.0)))
