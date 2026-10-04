[<Struct>]
type Point = { X: float; Y: float }

let distance (a: Point) (b: Point) =
    sqrt ((a.X - b.X) ** 2.0 + (a.Y - b.Y) ** 2.0)

let divMod a b = struct (a / b, a % b)

let p = { X = 0.0; Y = 0.0 }
let q = { X = 3.0; Y = 4.0 }
printfn "%f" (distance p q)

let struct (quot, rem) = divMod 17 5
printfn "%d r %d" quot rem

let t = (1, "two", 3.0)
let (a, b, c) = t
printfn "%d %s %.1f" a b c
printfn "%d %s" (fst (1, "x")) (snd (1, "x"))
