// Custom equality: two accounts are equal when their Id matches,
// regardless of the other fields.
[<CustomEquality; NoComparison>]
type Account =
    { Id: int
      Owner: string
      Balance: decimal }

    override this.Equals(other) =
        match other with
        | :? Account as a -> this.Id = a.Id
        | _ -> false

    override this.GetHashCode() = hash this.Id

let a1 = { Id = 1; Owner = "Ann"; Balance = 100M }
let a2 = { Id = 1; Owner = "Ann B."; Balance = 999M }
let a3 = { Id = 2; Owner = "Ann"; Balance = 100M }

printfn "%b" (a1 = a2)
printfn "%b" (a1 = a3)
printfn "%b" (a1.Equals(a2))

// Works as a map key and with List.distinct using the custom equality
let table = dict [ (a1.Id, a1) ]
printfn "%d" table.Count

let distinct = [ a1; a2; a3 ] |> List.distinct
printfn "%d" distinct.Length

// ReferenceEquality: equal only if same object
[<ReferenceEquality>]
type Handle = { Name: string }

let h1 = { Name = "x" }
let h2 = { Name = "x" }
printfn "%b %b" (h1 = h2) (h1 = h1)
