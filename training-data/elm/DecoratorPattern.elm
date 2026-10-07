module DecoratorPattern exposing (Greeter, exclaim, shout, withGreeting)

{-| The Gang-of-Four Decorator pattern needs no wrapper objects in Elm:
"decorating" a function just means composing it with another function of
the same shape, layering extra behavior around the original without
modifying it.
-}


type alias Greeter =
    String -> String


withGreeting : Greeter
withGreeting name =
    "Hello, " ++ name ++ "."


shout : Greeter -> Greeter
shout greeter name =
    String.toUpper (greeter name)


exclaim : Greeter -> Greeter
exclaim greeter name =
    greeter name ++ "!"
