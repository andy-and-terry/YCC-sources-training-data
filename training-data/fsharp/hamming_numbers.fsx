// Hamming numbers (5-smooth): only prime factors 2, 3 and 5
let rec strip p n = if n % p = 0 then strip p (n / p) else n

let isHamming n = n |> strip 2 |> strip 3 |> strip 5 = 1

Seq.initInfinite ((+) 1)
|> Seq.filter isHamming
|> Seq.take 20
|> Seq.map string
|> String.concat " "
|> printfn "%s"
