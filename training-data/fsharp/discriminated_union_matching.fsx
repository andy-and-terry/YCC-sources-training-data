type Shape =
    | Circle of radius: float
    | Rect of width: float * height: float
    | Triangle of float * float * float

let area = function
    | Circle r -> System.Math.PI * r * r
    | Rect (w, h) -> w * h
    | Triangle (a, b, c) ->
        let s = (a + b + c) / 2.0
        sqrt (s * (s - a) * (s - b) * (s - c))

for s in [ Circle 1.0; Rect(2.0, 3.0); Triangle(3.0, 4.0, 5.0) ] do
    printfn "%.2f" (area s)
