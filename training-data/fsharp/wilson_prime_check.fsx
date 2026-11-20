// Wilson's theorem primality test.
let wilson n = n >= 2 && Seq.fold (fun f i -> f * i % n) 1 (seq { 2 .. n - 1 }) = n - 1
printfn "%A" ([ 2 .. 19 ] |> List.filter wilson)
