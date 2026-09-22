type Greeter = string -> string

let withGreeting: Greeter = fun name -> sprintf "Hello, %s." name

let shout (greeter: Greeter) : Greeter = fun name -> (greeter name).ToUpper()

let exclaim (greeter: Greeter) : Greeter = fun name -> greeter name + "!"

let decorated = withGreeting |> shout |> exclaim

printfn "%s" (withGreeting "Sam")
printfn "%s" (decorated "Sam")
