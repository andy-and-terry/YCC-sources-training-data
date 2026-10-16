// user-defined infix operators
let (|+|) (a1, b1) (a2, b2) = (a1 + a2, b1 + b2)
let (.*) (a1, b1) (a2, b2) = a1 * a2 + b1 * b2
let (!!) x = x * x
let ( ** ) s n = String.replicate n s

printfn "%A" ((1, 2) |+| (10, 20))
printfn "%d" ((1, 2) .* (3, 4))
printfn "%d" (!! 7)
printfn "%s" ("ab" ** 3)

type Vec = { X: float; Y: float } with
    static member (+) (a, b) = { X = a.X + b.X; Y = a.Y + b.Y }
    static member (*) (k: float, v) = { X = k * v.X; Y = k * v.Y }

printfn "%A" ({ X = 1.0; Y = 2.0 } + 2.0 * { X = 1.0; Y = 1.0 })
