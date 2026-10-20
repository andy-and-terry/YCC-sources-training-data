[<Measure>] type m
[<Measure>] type s

let distance = 100.0<m>
let time = 9.58<s>
let speed = distance / time
printfn "%.2f" (float speed)

let addDist (a: float<m>) (b: float<m>) = a + b
printfn "%.1f" (float (addDist 3.0<m> 4.5<m>))

[<Measure>] type kg
let mass = 70.0<kg>
let force = mass * 9.81<m / s ^ 2>
printfn "%.1f" (float force)
