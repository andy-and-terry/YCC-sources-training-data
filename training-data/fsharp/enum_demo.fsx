type Color =
    | Red = 1
    | Green = 2
    | Blue = 3

let c = Color.Green
printfn "%A" c
printfn "%d" (int c)
printfn "%A" (enum<Color> 3)
printfn "%b" (System.Enum.IsDefined(typeof<Color>, 2))
printfn "%A" (System.Enum.Parse(typeof<Color>, "Blue"))

let names = System.Enum.GetNames typeof<Color>
printfn "%A" names

let describe = function
    | Color.Red -> "warm"
    | Color.Green | Color.Blue -> "cool"
    | _ -> "unknown"

for c in [ Color.Red; Color.Blue; enum<Color> 42 ] do
    printfn "%A: %s" c (describe c)
