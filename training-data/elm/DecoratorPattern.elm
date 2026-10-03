module DecoratorPattern exposing
    ( Coffee
    , cost
    , describe
    , plainCoffee
    , withMilk
    , withSugar
    , withWhippedCream
    )

{-| The Gang-of-Four Decorator pattern in Elm: instead of wrapping objects at
runtime, each decorator is a plain function `Coffee -> Coffee` that returns a
new, immutable value with the added behavior folded in. Decorators compose
with ordinary function (or `|>` pipeline) composition, no wrapper classes
needed.
-}


type alias Coffee =
    { description : String
    , price : Float
    }


plainCoffee : Coffee
plainCoffee =
    { description = "Coffee", price = 2.0 }


withMilk : Coffee -> Coffee
withMilk coffee =
    { coffee
        | description = coffee.description ++ " + milk"
        , price = coffee.price + 0.5
    }


withSugar : Coffee -> Coffee
withSugar coffee =
    { coffee
        | description = coffee.description ++ " + sugar"
        , price = coffee.price + 0.25
    }


withWhippedCream : Coffee -> Coffee
withWhippedCream coffee =
    { coffee
        | description = coffee.description ++ " + whipped cream"
        , price = coffee.price + 0.75
    }


describe : Coffee -> String
describe coffee =
    coffee.description ++ " ($" ++ String.fromFloat coffee.price ++ ")"


cost : Coffee -> Float
cost coffee =
    coffee.price
