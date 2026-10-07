[<Struct>]
type Vec2 =
    { X: float
      Y: float }

    member v.Length = sqrt (v.X * v.X + v.Y * v.Y)
    static member (+)(a: Vec2, b: Vec2) = { X = a.X + b.X; Y = a.Y + b.Y }

[<Struct>]
type Range(lo: int, hi: int) =
    member _.Lo = lo
    member _.Hi = hi
    member _.Width = hi - lo
    member r.Contains n = n >= lo && n < hi

let a = { X = 3.0; Y = 4.0 }
let b = { X = 1.0; Y = 1.0 }
printfn "%f" a.Length
printfn "%A" (a + b)

let r = Range(10, 20)
printfn "%d %b %b" r.Width (r.Contains 15) (r.Contains 20)
printfn "%b" (a = { X = 3.0; Y = 4.0 })

let points = [| for i in 1 .. 3 -> { X = float i; Y = float (i * i) } |]
printfn "%f" (points |> Array.sumBy (fun p -> p.Y))
