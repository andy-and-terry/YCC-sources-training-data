// Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
let rec gcd a b = if b = 0 then a else gcd b (a % b)

let powMod b e m =
    let rec go b e r =
        if e = 0 then r
        else go (b * b % m) (e / 2) (if e % 2 = 1 then r * b % m else r)
    go (b % m) e 1

let isPrime n = n > 1 && Seq.forall (fun p -> n % p <> 0) (seq { 2 .. int (sqrt (float n)) })

let isCarmichael n =
    not (isPrime n) && Seq.forall (fun a -> gcd a n <> 1 || powMod a (n - 1) n = 1) (seq { 2 .. n - 1 })

[ 3 .. 2 .. 2999 ] |> List.filter isCarmichael |> List.map string |> String.concat " " |> printfn "%s"
