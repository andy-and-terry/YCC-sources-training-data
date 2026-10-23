// Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
let padovan =
    Seq.unfold (fun (a, b, c) -> Some(a, (b, c, a + b))) (1L, 1L, 1L)

padovan |> Seq.take 15 |> Seq.map string |> String.concat " " |> printfn "%s"
