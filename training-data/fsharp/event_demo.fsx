// Events: publish with Event<'T>, subscribe via the Publish property.
type Counter() =
    let changed = Event<int>()
    let mutable value = 0

    [<CLIEvent>]
    member _.Changed = changed.Publish

    member _.Increment() =
        value <- value + 1
        changed.Trigger value

let counter = Counter()

counter.Changed.Add(fun v -> printfn "changed to %d" v)

let handler = counter.Changed |> Event.filter (fun v -> v % 2 = 0)
let sub = handler.Subscribe(fun v -> printfn "even: %d" v)

counter.Increment()
counter.Increment()
sub.Dispose()
counter.Increment()
counter.Increment()
