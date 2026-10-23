module MaybeMap3Demo exposing (makeUser)


type alias User =
    { name : String
    , age : Int
    , email : String
    }


makeUser : Maybe String -> Maybe Int -> Maybe String -> Maybe User
makeUser maybeName maybeAge maybeEmail =
    Maybe.map3 User maybeName maybeAge maybeEmail
