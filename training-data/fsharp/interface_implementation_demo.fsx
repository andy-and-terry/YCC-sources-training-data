type IShape =
    abstract Area: float
    abstract Name: string

type Circle(r: float) =
    interface IShape with
        member _.Area = System.Math.PI * r * r
        member _.Name = "circle"

type Rect(w: float, h: float) =
    interface IShape with
        member _.Area = w * h
        member _.Name = "rect"

let describe (s: IShape) = printfn "%s: %.2f" s.Name s.Area

let shapes: IShape list = [ Circle 1.5; Rect(2.0, 3.5) ]
shapes |> List.iter describe

let unitShape =
    { new IShape with
        member _.Area = 1.0
        member _.Name = "unit" }

describe unitShape
shapes |> List.sumBy (fun s -> s.Area) |> printfn "total %.2f"
let biggest = shapes |> List.maxBy (fun s -> s.Area)
printfn "biggest is %s" biggest.Name
