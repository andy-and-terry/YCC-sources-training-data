let alternatingDigitSum (n: int) =
    string n
    |> Seq.rev
    |> Seq.mapi (fun i c -> let d = int c - int '0' in if i % 2 = 0 then d else -d)
    |> Seq.sum

for n in [ 1234; 99999; 1000 ] do
    printfn "%d %d" n (alternatingDigitSum n)
