type IShape =
    abstract Area: float
    abstract Name: string

type Circle(r: float) =
    interface IShape with
        member _.Area = System.Math.PI * r * r
        member _.Name = "circle"

type Square(s: float) =
    interface IShape with
        member _.Area = s * s
        member _.Name = "square"

let describe (shape: IShape) = sprintf "%s: %.2f" shape.Name shape.Area

let shapes: IShape list = [ Circle 1.5; Square 2.0 ]
shapes |> List.iter (describe >> printfn "%s")

let unitShape =
    { new IShape with
        member _.Area = 1.0
        member _.Name = "unit" }

printfn "%s" (describe unitShape)

let total = shapes |> List.sumBy (fun s -> s.Area)
printfn "total %.3f" total

let c = Circle 1.0
printfn "%s" (describe (c :> IShape))
