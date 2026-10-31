let digitProduct (n: int64) =
    string n |> Seq.fold (fun acc c -> acc * int64 (int c - int '0')) 1L

let rec persistence (n: int64) =
    if n < 10L then 0 else 1 + persistence (digitProduct n)

for n in [ 39L; 77L; 999L; 10L ] do
    printfn "%d %d" n (persistence n)
