exception InsufficientFunds of string

let withdraw balance amount =
    if amount > balance then
        raise (InsufficientFunds(sprintf "cannot withdraw %d, balance is %d" amount balance))
    else
        balance - amount

try
    withdraw 100 200 |> ignore
with
| InsufficientFunds msg -> printfn "Caught: %s" msg

printfn "%d" (withdraw 100 50)
