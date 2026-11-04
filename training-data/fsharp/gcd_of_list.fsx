let rec gcd a b = if b = 0 then abs a else gcd b (a % b)

let gcdAll nums = List.fold gcd 0 nums

printfn "%d" (gcdAll [ 12; 18; 24 ])
printfn "%d" (gcdAll [ 7; 13 ])
