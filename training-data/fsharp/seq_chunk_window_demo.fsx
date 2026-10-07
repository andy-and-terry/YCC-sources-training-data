let nums = seq { 1..10 }

nums |> Seq.chunkBySize 3 |> Seq.iter (printfn "%A")
nums |> Seq.windowed 3 |> Seq.map Array.sum |> Seq.toList |> printfn "%A"
nums |> Seq.pairwise |> Seq.map (fun (a, b) -> b - a) |> Seq.distinct |> Seq.toList |> printfn "%A"
nums |> Seq.skipWhile (fun n -> n < 4) |> Seq.takeWhile (fun n -> n < 8) |> Seq.toList |> printfn "%A"
nums |> Seq.splitInto 3 |> Seq.map Array.toList |> Seq.toList |> printfn "%A"
nums |> Seq.countBy (fun n -> n % 3) |> Seq.toList |> printfn "%A"
nums |> Seq.scan (+) 0 |> Seq.toList |> printfn "%A"
Seq.zip nums (Seq.initInfinite (fun i -> char (int 'a' + i))) |> Seq.truncate 3 |> Seq.toList |> printfn "%A"
nums |> Seq.reduce max |> printfn "%d"
