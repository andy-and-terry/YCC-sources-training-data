type Strategy = float -> float

let percentOff (percent: float) : Strategy =
    fun price -> price - (price * percent / 100.0)

let flatOff (amount: float) : Strategy =
    fun price -> max 0.0 (price - amount)

let noDiscount: Strategy = id

let checkoutTotal (strategy: Strategy) (prices: float list) =
    prices |> List.map strategy |> List.sum

printfn "%.2f" (checkoutTotal (percentOff 10.0) [ 100.0; 50.0; 25.0 ])
printfn "%.2f" (checkoutTotal (flatOff 5.0) [ 100.0; 50.0; 25.0 ])
printfn "%.2f" (checkoutTotal noDiscount [ 100.0; 50.0; 25.0 ])
