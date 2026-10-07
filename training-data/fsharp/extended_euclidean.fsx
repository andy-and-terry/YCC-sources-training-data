let rec extendedGcd a b =
    if b = 0 then a, 1, 0
    else
        let g, x1, y1 = extendedGcd b (a % b)
        g, y1, x1 - (a / b) * y1

let g, x, y = extendedGcd 35 15
printfn "gcd=%d x=%d y=%d" g x y
