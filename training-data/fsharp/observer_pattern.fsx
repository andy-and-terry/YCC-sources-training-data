type Subject() =
    let priceChanged = Event<float>()

    [<CLIEvent>]
    member _.PriceChanged = priceChanged.Publish

    member _.SetPrice(price: float) =
        priceChanged.Trigger price

let subject = Subject()

subject.PriceChanged.Add(fun price -> printfn "Observer A: price is now %.2f" price)
subject.PriceChanged.Add(fun price -> printfn "Observer B: logging price %.2f" price)

subject.SetPrice 10.5
subject.SetPrice 12.25
