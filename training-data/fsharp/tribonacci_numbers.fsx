// Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
let tribonacci =
    Seq.unfold (fun (a, b, c) -> Some(a, (b, c, a + b + c))) (0L, 0L, 1L)

let terms = tribonacci |> Seq.take 15 |> Seq.map string |> String.concat ", "
printfn "Tribonacci: %s" terms
