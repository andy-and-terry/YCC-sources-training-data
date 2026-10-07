let name = "F#"
let version = 8.0
let count = 42

printfn "Hello, %s!" name
printfn "version %.1f" version
printfn "[%5d] [%-5d] [%05d]" count count count
printfn "%x %X %o %b" 255 255 8 5
printfn "%10s|%-10s|" "right" "left"
printfn "%A" [ 1; 2; 3 ]
printfn "%A" (Some 3)

let s = sprintf "%s has %d items costing %.2f" "cart" 3 9.5
printfn "%s" s
printfn $"interpolated: {name} v{version:F1}, count={count + 1}"
printfn "%c%c" 'O' 'K'
printfn "%e" 12345.678
printfn "%M" 12.5M
