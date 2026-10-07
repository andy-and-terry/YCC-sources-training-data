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

let shapes: IShape list = [ Rect(2.0, 3.0); Circle(1.5) ]

for s in shapes do
    printfn "%s: %.2f" s.Name s.Area
