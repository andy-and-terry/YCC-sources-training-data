let digits = "0123456789abcdefghijklmnopqrstuvwxyz"

let toBase (n: int) (b: int) =
    if n = 0 then "0"
    else
        Seq.unfold (fun k -> if k = 0 then None else Some(digits.[k % b], k / b)) n
        |> Seq.rev
        |> Seq.toArray
        |> System.String

for b in [ 2; 8; 16; 36 ] do
    printfn "255 in base %d = %s" b (toBase 255 b)

printfn "%d" (System.Convert.ToInt32("ff", 16))
