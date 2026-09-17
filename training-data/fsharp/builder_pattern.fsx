type Pizza =
    { Size: string
      Cheese: bool
      Pepperoni: bool
      Mushrooms: bool }

type PizzaBuilder() =
    let mutable size = "medium"
    let mutable cheese = false
    let mutable pepperoni = false
    let mutable mushrooms = false

    member this.WithSize(s: string) =
        size <- s
        this

    member this.AddCheese() =
        cheese <- true
        this

    member this.AddPepperoni() =
        pepperoni <- true
        this

    member this.AddMushrooms() =
        mushrooms <- true
        this

    member _.Build() : Pizza =
        { Size = size
          Cheese = cheese
          Pepperoni = pepperoni
          Mushrooms = mushrooms }

let pizza =
    PizzaBuilder()
        .WithSize("large")
        .AddCheese()
        .AddMushrooms()
        .Build()

printfn "%A" pizza
