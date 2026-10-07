let isPowerOfTwo n = n > 0 && (n &&& (n - 1)) = 0

let countBits (n: int) =
    let rec loop x acc =
        if x = 0 then acc else loop (x &&& (x - 1)) (acc + 1)
    loop n 0

let grayCode n = [ for i in 0 .. (1 <<< n) - 1 -> i ^^^ (i >>> 1) ]

printfn "%b %b" (isPowerOfTwo 64) (isPowerOfTwo 65)
printfn "%d" (countBits 0b101101)
printfn "%d" (1 <<< 10)
printfn "%d" (-16 >>> 2)
printfn "%d" (0b1100 ||| 0b0011)
printfn "%d" (6 ^^^ 3)
printfn "%d" (~~~5)
grayCode 3 |> List.iter (fun g -> printfn "%s" (System.Convert.ToString(g, 2).PadLeft(3, '0')))
