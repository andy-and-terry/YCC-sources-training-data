let a = 0b1100
let b = 0b1010

printfn "and: %d" (a &&& b)
printfn "or:  %d" (a ||| b)
printfn "xor: %d" (a ^^^ b)
printfn "not: %d" (~~~a)
printfn "shl: %d" (a <<< 2)
printfn "shr: %d" (a >>> 2)

let toBinary (n: int) = System.Convert.ToString(n, 2).PadLeft(8, '0')
printfn "%s" (toBinary (a ||| b))

let isSet bit n = (n >>> bit) &&& 1 = 1
printfn "%b %b" (isSet 2 a) (isSet 0 a)
printfn "%x" 0xFF
printfn "%X" (255 &&& 0x0F)
printfn "%d" (-16 >>> 2)
