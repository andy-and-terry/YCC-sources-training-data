module ValidationAccumulate exposing (validate)


type alias Signup =
    { name : String
    , age : Int
    , email : String
    }


validate : Signup -> List String
validate s =
    List.filterMap identity
        [ if String.isEmpty s.name then
            Just "name required"

          else
            Nothing
        , if s.age < 18 then
            Just "must be adult"

          else
            Nothing
        , if String.contains "@" s.email then
            Nothing

          else
            Just "invalid email"
        ]
