let rec gcd a b = if b = 0 then abs a else gcd b (a % b)
let lcm a b = abs (a * b) / gcd a b

printfn "%d" (gcd 48 18)
printfn "%d" (lcm 4 6)
