[<Struct>]
type Vec2 =
    { X: float
      Y: float }
    member v.Length = sqrt (v.X * v.X + v.Y * v.Y)
    static member (+)(a: Vec2, b: Vec2) = { X = a.X + b.X; Y = a.Y + b.Y }

[<Struct>]
type Money(amount: decimal, currency: string) =
    member _.Amount = amount
    member _.Currency = currency
    override _.ToString() = sprintf "%M %s" amount currency

let tryParse (s: string) : struct (bool * int) =
    match System.Int32.TryParse s with
    | true, v -> struct (true, v)
    | _ -> struct (false, 0)

let v = { X = 3.0; Y = 4.0 } + { X = 0.0; Y = 0.0 }
printfn "%f" v.Length
printfn "%O" (Money(12.5m, "EUR"))

let struct (ok, n) = tryParse "42"
printfn "%b %d" ok n
let struct (bad, _) = tryParse "x"
printfn "%b" bad
printfn "%b" (typeof<Vec2>.IsValueType)
