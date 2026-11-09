module Validate exposing (age)

age : String -> Result String Int
age s =
    case String.toInt s of
        Nothing -> Err "not a number"
        Just n ->
            if n < 0 then Err "negative" else Ok n
