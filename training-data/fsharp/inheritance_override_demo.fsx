type Shape(name: string) =
    abstract Area: unit -> float
    default _.Area() = 0.0
    abstract Describe: unit -> string
    default this.Describe() = sprintf "%s with area %.2f" name (this.Area())

type Circle(r: float) =
    inherit Shape("circle")
    override _.Area() = System.Math.PI * r * r

type Rect(w: float, h: float) =
    inherit Shape("rect")
    override _.Area() = w * h
    override this.Describe() = "[" + base.Describe() + "]"

let shapes : Shape list = [ Circle 1.0; Rect(2.0, 3.0); Shape "blob" ]
for s in shapes do
    printfn "%s" (s.Describe())
