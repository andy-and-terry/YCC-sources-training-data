let fletcher16 (data: byte[]) =
    let s1, s2 =
        data
        |> Array.fold (fun (a, b) x ->
            let a' = (a + int x) % 255
            a', (b + a') % 255) (0, 0)
    (s2 <<< 8) ||| s1

printfn "%x" (fletcher16 (System.Text.Encoding.ASCII.GetBytes "abcde"))
