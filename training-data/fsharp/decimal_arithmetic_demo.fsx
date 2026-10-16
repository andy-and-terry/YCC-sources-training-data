let a = 0.1
let b = 0.2
printfn "float:   %b" (a + b = 0.3)

let c = 0.1M
let d = 0.2M
printfn "decimal: %b" (c + d = 0.3M)

let price = 19.99M
let qty = 3M
let total = price * qty
printfn "total = %M" total
printfn "rounded = %M" (System.Math.Round(total * 1.0825M, 2))
printfn "%M" (decimal 7 / 3M)
printfn "%M" (System.Math.Round(2.5M))
printfn "%M" (System.Math.Round(2.5M, System.MidpointRounding.AwayFromZero))
