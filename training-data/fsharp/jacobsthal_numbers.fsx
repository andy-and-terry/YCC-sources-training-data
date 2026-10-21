// Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
let jacobsthal =
    Seq.unfold (fun (a, b) -> Some(a, (b, b + 2 * a))) (0, 1)

jacobsthal
|> Seq.take 15
|> Seq.map string
|> String.concat " "
|> printfn "%s"
