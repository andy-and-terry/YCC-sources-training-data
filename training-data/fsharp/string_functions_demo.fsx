open System

let s = "  The quick brown fox  "

printfn "[%s]" (s.Trim())
printfn "%s" (s.Trim().ToUpper())
printfn "%A" (s.Trim().Split(' '))
printfn "%s" (String.Join("-", [ "a"; "b"; "c" ]))
printfn "%s" (String.concat ", " [ "x"; "y" ])
printfn "%b" (s.Contains "quick")
printfn "%s" (s.Replace("quick", "slow").Trim())
printfn "%s" (String('=', 5))
printfn "%s" ("abc" |> Seq.rev |> Seq.toArray |> String)
printfn "%d" ("hello world" |> Seq.filter (fun c -> "aeiou".Contains c) |> Seq.length)
printfn "%s" ("hello".PadLeft(8, '.') + "|" + "hi".PadRight(5) + "|")
printfn "%A" (String.IsNullOrWhiteSpace "   ")
printfn "%s" (sprintf "%5.1f|%-6s|%04d|%x" 3.14159 "ab" 42 255)
let n = "nested"
printfn "%s" ($"{1 + 2} and {n.Length}")
