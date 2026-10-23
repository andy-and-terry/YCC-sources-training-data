module Geometry =
    let pi = 3.14159

    module Circle =
        let area r = pi * r * r
        let circumference r = 2.0 * pi * r

    module Rectangle =
        let area w h = w * h
        let perimeter w h = 2.0 * (w + h)

    let private secret = 42
    let reveal () = secret

open Geometry

printfn "%.2f" (Circle.area 2.0)
printfn "%.2f" (Circle.circumference 1.0)
printfn "%.1f" (Rectangle.area 3.0 4.5)
printfn "%.1f" (Rectangle.perimeter 3.0 4.0)
printfn "%d" (reveal ())
