module BuilderPattern exposing (Pizza, PizzaBuilder, addTopping, build, newBuilder, setSize)

{-| The Gang-of-Four Builder pattern step-by-step assembles a value via a
chain of updates on an intermediate builder record, then converts it to the
final product with `build`. Elm needs no separate `Director`/`Builder`
classes: the builder is just a record threaded through plain functions.
-}


type alias Pizza =
    { size : String
    , toppings : List String
    , price : Float
    }


type alias PizzaBuilder =
    { size : String
    , toppings : List String
    }


newBuilder : PizzaBuilder
newBuilder =
    { size = "medium", toppings = [] }


setSize : String -> PizzaBuilder -> PizzaBuilder
setSize size builder =
    { builder | size = size }


addTopping : String -> PizzaBuilder -> PizzaBuilder
addTopping topping builder =
    { builder | toppings = builder.toppings ++ [ topping ] }


basePrice : String -> Float
basePrice size =
    case size of
        "small" ->
            6.0

        "large" ->
            10.0

        _ ->
            8.0


build : PizzaBuilder -> Pizza
build builder =
    { size = builder.size
    , toppings = builder.toppings
    , price = basePrice builder.size + toFloat (List.length builder.toppings) * 1.5
    }
