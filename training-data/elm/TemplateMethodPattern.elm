module TemplateMethodPattern exposing (brewCoffee, brewTea, makeBeverage)

{-| The Gang-of-Four Template Method pattern needs no base class in Elm:
the fixed algorithm skeleton is just a function that takes the varying
steps as arguments and calls them in a fixed order.
-}


makeBeverage : (() -> String) -> (() -> String) -> List String
makeBeverage brew addCondiments =
    [ "boil water", brew (), addCondiments (), "pour in cup" ]


brewCoffee : List String
brewCoffee =
    makeBeverage (\() -> "brew coffee grounds") (\() -> "add sugar and milk")


brewTea : List String
brewTea =
    makeBeverage (\() -> "steep tea bag") (\() -> "add lemon")
