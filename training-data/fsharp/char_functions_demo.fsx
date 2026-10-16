open System

let samples = [ 'a'; 'Z'; '5'; ' '; '!'; 'é' ]

for c in samples do
    printfn "%A letter=%b digit=%b upper=%b space=%b punct=%b" c
        (Char.IsLetter c) (Char.IsDigit c) (Char.IsUpper c)
        (Char.IsWhiteSpace c) (Char.IsPunctuation c)

printfn "%c" (Char.ToUpper 'q')
printfn "%d" (int 'A')
printfn "%c" (char 100)
printfn "%c" (char (int 'a' + 3))
printfn "%d" (Char.GetNumericValue '7' |> int)
