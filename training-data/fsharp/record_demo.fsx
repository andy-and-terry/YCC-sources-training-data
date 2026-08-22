type Point = { X: float; Y: float }

let addPoints a b = { X = a.X + b.X; Y = a.Y + b.Y }

let p1 = { X = 1.0; Y = 2.0 }
let p2 = { X = 3.0; Y = 4.0 }
printfn "%A" (addPoints p1 p2)
