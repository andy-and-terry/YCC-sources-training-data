module OpaqueTypeDemo exposing (Email, fromString, toString)


type Email
    = Email String


fromString : String -> Maybe Email
fromString raw =
    if String.contains "@" raw then
        Just (Email raw)

    else
        Nothing


toString : Email -> String
toString (Email raw) =
    raw
