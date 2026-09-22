type State =
    | Idle
    | CoinInserted
    | Dispensing

let insertCoin state =
    match state with
    | Idle -> CoinInserted
    | other -> other

let selectItem state =
    match state with
    | CoinInserted -> Dispensing
    | other -> other

let dispense state =
    match state with
    | Dispensing -> Idle
    | other -> other

let final =
    Idle
    |> insertCoin
    |> selectItem
    |> dispense

printfn "%A" final
printfn "%A" (Idle |> selectItem)
