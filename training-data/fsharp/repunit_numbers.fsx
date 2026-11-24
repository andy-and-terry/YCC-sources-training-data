// Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
Seq.scan (fun r _ -> r * 10L + 1L) 0L [ 1 .. 8 ]
|> Seq.skip 1
|> Seq.iter (fun r -> printfn "%d%s" r (if r % 3L = 0L then "  (divisible by 3)" else ""))
