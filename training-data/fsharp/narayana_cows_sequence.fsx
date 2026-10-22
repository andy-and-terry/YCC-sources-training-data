// Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
let cows =
    Seq.unfold (fun (a, b, c) -> Some(a, (b, c, a + c))) (1L, 1L, 1L)

cows |> Seq.take 15 |> Seq.map string |> String.concat " " |> printfn "%s"
