let name = "Ada"
let n = 42
printfn "Hello %s, you are %d (%5.2f) %x %b" name n 3.14159 255 true
printfn $"Interpolated {name} {n * 2} {System.Math.PI:F3}"
printfn "%s" ("a,b,c".Split ',' |> String.concat "|")
printfn "%s" (String.replicate 3 "ab")
printfn "%A" ("hello".ToUpper(), "Hello".Substring(1, 3), "  pad ".Trim(), "abc".[1], "abc".Contains "bc")
printfn "%s" (System.String.Join(", ", [ 1; 2; 3 ]))
printfn "%A" ("x=1;y=2".Split ';' |> Array.map (fun kv -> let p = kv.Split '=' in p.[0], int p.[1]) |> Map.ofArray)
printfn "%10s|%-10s|" "right" "left"
