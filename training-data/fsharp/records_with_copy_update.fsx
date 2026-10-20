type Person = { Name: string; Age: int; Tags: string list }

let p = { Name = "Ada"; Age = 36; Tags = [] }
let q = { p with Age = 37; Tags = [ "math" ] }
printfn "%A" q
printfn "%b" (p = { Name = "Ada"; Age = 36; Tags = [] })

let { Name = n; Age = a } = q
printfn "%s %d" n a
type Point = { X: float; Y: float } with
    member this.Dist = sqrt (this.X ** 2.0 + this.Y ** 2.0)
    static member Origin = { X = 0.0; Y = 0.0 }
printfn "%.1f %A" { X = 3.0; Y = 4.0 }.Dist Point.Origin
