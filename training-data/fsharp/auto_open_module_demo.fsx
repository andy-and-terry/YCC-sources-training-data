// [<AutoOpen>] makes a nested module's contents available without qualification.
module Shapes =
    type Shape =
        | Circle of float
        | Square of float

    let area shape =
        match shape with
        | Circle r -> System.Math.PI * r * r
        | Square s -> s * s

[<AutoOpen>]
module Helpers =
    let square x = x * x
    let (|Even|Odd|) n = if n % 2 = 0 then Even else Odd

    [<RequireQualifiedAccess>]
    module Strict =
        let describe n = sprintf "number %d" n

printfn "%d" (square 7)

match 10 with
| Even -> printfn "even"
| Odd -> printfn "odd"

// Helpers needs no 'open', Shapes does
open Shapes
printfn "%.2f" (area (Circle 1.0))
printfn "%.1f" (area (Square 3.0))

// RequireQualifiedAccess forces the Strict. prefix
printfn "%s" (Strict.describe 5)
