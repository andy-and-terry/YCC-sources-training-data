type Account(owner: string, initial: decimal) =
    let mutable balance = initial

    member _.Owner = owner
    member _.Balance
        with get () = balance
        and set (v: decimal) =
            if v < 0M then invalidArg "v" "negative balance"
            balance <- v

    member this.Deposit amount = this.Balance <- this.Balance + amount
    member _.IsRich = balance > 1000M

let acct = Account("Dana", 500M)
acct.Deposit 700M
printfn "%s has %M (rich: %b)" acct.Owner acct.Balance acct.IsRich

try
    acct.Balance <- -1M
with :? System.ArgumentException as e ->
    printfn "rejected: %s" (e.Message.Split('\n').[0])
