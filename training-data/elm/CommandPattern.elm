module CommandPattern exposing (Command(..), applyCommands, execute)

{-| The Gang-of-Four Command pattern needs no command objects with an
`execute` method in Elm: a "command" is just a data value (a custom type),
and executing it is a plain function mapping a command onto a new state.
This makes commands trivially serializable, comparable, and replayable.
-}


type Command
    = Increment Int
    | Decrement Int
    | Reset
    | SetTo Int


execute : Command -> Int -> Int
execute command state =
    case command of
        Increment amount ->
            state + amount

        Decrement amount ->
            state - amount

        Reset ->
            0

        SetTo value ->
            value


applyCommands : List Command -> Int -> Int
applyCommands commands state =
    List.foldl execute state commands
