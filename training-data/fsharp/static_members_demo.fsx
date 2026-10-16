type Counter() =
    static let mutable instances = 0
    do instances <- instances + 1

    static member Instances = instances
    static member Create() = Counter()
    static member val Name = "Counter" with get, set

let _ = Counter()
let _ = Counter.Create()
let _ = Counter.Create()

printfn "%d instances" Counter.Instances
Counter.Name <- "Renamed"
printfn "%s" Counter.Name

type MathUtil =
    static member Square (x: int) = x * x
    static member Hypot (a: float, b: float) = sqrt (a * a + b * b)

printfn "%d %.1f" (MathUtil.Square 9) (MathUtil.Hypot(3.0, 4.0))
