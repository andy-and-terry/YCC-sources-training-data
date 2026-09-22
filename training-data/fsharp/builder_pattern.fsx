type Pizza =
    { Size: string
      Toppings: string list
      ExtraCheese: bool }

type PizzaBuilder(size: string) =
    let mutable toppings = []
    let mutable extraCheese = false

    member this.WithTopping(topping: string) =
        toppings <- topping :: toppings
        this

    member this.WithExtraCheese() =
        extraCheese <- true
        this

    member _.Build() : Pizza =
        { Size = size
          Toppings = List.rev toppings
          ExtraCheese = extraCheese }

let pizza =
    PizzaBuilder("large")
        .WithTopping("pepperoni")
        .WithTopping("mushroom")
        .WithExtraCheese()
        .Build()

printfn "%A" pizza
