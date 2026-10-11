open System.Text

let sb = StringBuilder()
sb.Append("Hello").Append(", ").Append("World") |> ignore
sb.AppendLine("!") |> ignore
sb.AppendFormat("{0} + {1} = {2}", 2, 3, 5) |> ignore
printfn "%s" (sb.ToString())
printfn "length: %d" sb.Length

sb.Clear() |> ignore
for i in 1 .. 5 do
    sb.Append(i).Append(if i < 5 then "," else "") |> ignore
printfn "%s" (sb.ToString())
sb.Insert(0, "[").Append("]") |> ignore
printfn "%s" (sb.ToString())
