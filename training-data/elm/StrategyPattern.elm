module StrategyPattern exposing (Strategy, checkoutTotal, flatOff, noDiscount, percentOff)

{-| The Gang-of-Four Strategy pattern needs no interfaces or classes in Elm:
a "strategy" is just a function of the same shape, passed around as a value.
-}


type alias Strategy =
    Float -> Float


percentOff : Float -> Strategy
percentOff percent price =
    price - (price * percent / 100)


flatOff : Float -> Strategy
flatOff amount price =
    max 0 (price - amount)


noDiscount : Strategy
noDiscount price =
    price


checkoutTotal : Strategy -> List Float -> Float
checkoutTotal strategy prices =
    prices
        |> List.map strategy
        |> List.sum
