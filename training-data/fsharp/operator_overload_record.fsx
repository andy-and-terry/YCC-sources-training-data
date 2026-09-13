type Vector2 =
    { X: float; Y: float }

    static member (+) (a: Vector2, b: Vector2) =
        { X = a.X + b.X; Y = a.Y + b.Y }

    static member (-) (a: Vector2, b: Vector2) =
        { X = a.X - b.X; Y = a.Y - b.Y }

    static member (*) (a: Vector2, scalar: float) =
        { X = a.X * scalar; Y = a.Y * scalar }

let v1 = { X = 1.0; Y = 2.0 }
let v2 = { X = 3.0; Y = 4.0 }

printfn "%A" (v1 + v2)
printfn "%A" (v2 - v1)
printfn "%A" (v1 * 3.0)
