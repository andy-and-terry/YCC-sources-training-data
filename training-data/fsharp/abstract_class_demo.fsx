[<AbstractClass>]
type Animal(name: string) =
    member _.Name = name
    abstract Speak: unit -> string
    default this.Speak() = sprintf "%s makes a sound" name

type Dog(name) =
    inherit Animal(name)
    override _.Speak() = "Woof"

type Fish(name) =
    inherit Animal(name)

let animals: Animal list = [ Dog "Rex"; Fish "Nemo" ]

for a in animals do
    printfn "%s: %s" a.Name (a.Speak())
