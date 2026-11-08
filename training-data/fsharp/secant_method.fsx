let secant f a b =
    let rec go a b i =
        let fa, fb = f a, f b
        if i > 40 || fa = fb then b
        else go b (b - fb * (b - a) / (fb - fa)) (i + 1)
    go a b 0

printfn "%.8f" (secant (fun x -> x * x - 2.0) 1.0 2.0)
