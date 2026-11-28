type Account = { Id: int; Balance: decimal }

let a = { Id = 1; Balance = 100m }
let b = { a with Balance = a.Balance + 50m }
printfn "%A -> %A" a b
