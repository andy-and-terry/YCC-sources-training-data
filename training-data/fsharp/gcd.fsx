let rec gcd a b =
    if b = 0 then a else gcd b (a % b)

printfn "%d" (gcd 48 18)
printfn "%d" (gcd 100 75)
