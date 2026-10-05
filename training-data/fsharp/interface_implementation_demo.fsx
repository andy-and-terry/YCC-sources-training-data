type IShape =
    abstract Area: float
    abstract Name: string

type Rect(w: float, h: float) =
    interface IShape with
        member _.Area = w * h
        member _.Name = "rect"

type Circle(r: float) =
    interface IShape with
        member _.Area = System.Math.PI * r * r
        member _.Name = "circle"

let describe (s: IShape) = sprintf "%s: %.2f" s.Name s.Area

let shapes: IShape list = [ Rect(2.0, 3.0); Circle(1.0) ]
shapes |> List.iter (describe >> printfn "%s")

let unitShape =
    { new IShape with
        member _.Area = 1.0
        member _.Name = "unit" }
printfn "%s" (describe unitShape)
