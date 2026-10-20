type IShape =
    abstract Area: unit -> float
    abstract Name: string

type Circle(r: float) =
    interface IShape with
        member _.Area() = System.Math.PI * r * r
        member _.Name = "circle"

type Square(s: float) =
    member _.Side = s
    interface IShape with
        member _.Area() = s * s
        member _.Name = "square"

type Animal(name: string) =
    abstract Speak: unit -> string
    default _.Speak() = name + " makes a sound"
    member _.Name = name

type Dog(name: string) =
    inherit Animal(name)
    override _.Speak() = name + " barks"

for s in [ Circle 1.0 :> IShape; Square 2.0 :> IShape ] do
    printfn "%s %.2f" s.Name (s.Area())
printfn "%s / %s" (Animal("x").Speak()) (Dog("Rex").Speak())
