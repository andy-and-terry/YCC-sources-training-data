let isSelfDescribing (n: int) =
    let s = string n
    s |> Seq.mapi (fun i c -> (s |> Seq.filter (fun x -> x = char (int '0' + i)) |> Seq.length) = int c - int '0')
      |> Seq.forall id

for n in [ 1210; 2020; 21200; 1211 ] do
    printfn "%d %b" n (isSelfDescribing n)
