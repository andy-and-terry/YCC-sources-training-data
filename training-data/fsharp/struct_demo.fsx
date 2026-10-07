[<Struct>]
type Vec2 =
    { X: float
      Y: float }

    member v.Length = sqrt (v.X * v.X + v.Y * v.Y)
    static member (+)(a: Vec2, b: Vec2) = { X = a.X + b.X; Y = a.Y + b.Y }

[<Struct>]
type Pair<'a, 'b> = Pair of first: 'a * second: 'b

let a = { X = 3.0; Y = 4.0 }
let b = { X = 1.0; Y = 1.0 }
printfn "length a = %.1f" a.Length
printfn "a + b = %A" (a + b)

let (Pair(x, y)) = Pair(1, "one")
printfn "%d %s" x y

let struct (p, q) = struct (10, 20)
printfn "%d" (p + q)
