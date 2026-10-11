let factorial (n: int) = [ 1I .. bigint n ] |> List.fold (*) 1I

printfn "%A" (factorial 25)
printfn "%A" (pown 2I 100)
printfn "%A" (System.Numerics.BigInteger.Parse "123456789012345678901234567890" + 1I)

let fib n =
    let rec go a b i = if i = 0 then a else go b (a + b) (i - 1)
    go 0I 1I n

printfn "fib 100 = %A" (fib 100)
printfn "digits in 2^200: %d" ((pown 2I 200).ToString().Length)
printfn "%A" (System.Numerics.BigInteger.GreatestCommonDivisor(1071I, 462I))
