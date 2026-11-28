let rec gcd a b = if b = 0L then a else gcd b (a % b)

let rho (n: int64) =
    if n % 2L = 0L then 2L
    else
        let f v = (v * v + 1L) % n
        let rec loop x y =
            let x1, y1 = f x, f (f y)
            match gcd (abs (x1 - y1)) n with
            | 1L -> loop x1 y1
            | d -> d
        loop 2L 2L

let n = 8051L
let p = rho n
printfn "%d = %d * %d" n p (n / p)
