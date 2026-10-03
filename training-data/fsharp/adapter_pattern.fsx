type LegacyRectangle = { Width: float; Height: float }

type Shape =
    | Circle of float
    | Rect of float * float

let adaptRectangle (legacy: LegacyRectangle) =
    Rect(legacy.Width, legacy.Height)

let area shape =
    match shape with
    | Circle r -> System.Math.PI * r * r
    | Rect(w, h) -> w * h

let legacy = { Width = 4.0; Height = 5.0 }
printfn "%.2f" (area (adaptRectangle legacy))
