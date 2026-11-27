let secant (f: float -> float) x0 x1 =
    let rec go n x0 x1 =
        let f0, f1 = f x0, f x1
        if n = 0 || f1 = f0 then x1
        else
            let next = x1 - f1 * (x1 - x0) / (f1 - f0)
            if abs (next - x1) < 1e-12 then next else go (n - 1) x1 next
    go 50 x0 x1

printfn "%.10f" (secant (fun x -> x * x - 2.0) 1.0 2.0)
