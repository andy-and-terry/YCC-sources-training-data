let str = "Hello, F# World!"

printfn "%s" (str.ToUpper())
printfn "%s" (str.ToLower())
printfn "%d" str.Length
printfn "%A" (str.Split(' '))
printfn "%s" (str.Replace("World", "Programming"))
