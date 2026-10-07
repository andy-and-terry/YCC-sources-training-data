let name = "Ada"
let age = 36
let pi = 3.14159265

printfn "%s is %d years old" name age
printfn "%5d|%-5d|%05d" 42 42 42
printfn "%.2f %8.3f %e" pi pi pi
printfn "%x %X %o %b" 255 255 8 5
printfn "%10s|%-10s|" "right" "left"
printfn "%c %b" 'z' true
printfn "%A" [ 1; 2; 3 ]
printfn "%A" (Some "x", None: int option)
printfn "%O" (System.DateTime(2024, 1, 2))

let s = sprintf "%s-%03d" "item" 7
printfn "%s" s
let f = sprintf "%+d %+d" 5 -5
printfn "%s" f
printfn $"interpolated {name} is {age + 1:N0} next year, pi {pi:F3}"
printfn "%*d" 6 42
let formatter = sprintf "%s=%d"
printfn "%s" (formatter "x" 10)
