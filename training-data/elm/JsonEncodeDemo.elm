module JsonEncodeDemo exposing (User, encodeUser, userToString)

import Json.Encode as Encode


type alias User =
    { name : String
    , age : Int
    , active : Bool
    }


encodeUser : User -> Encode.Value
encodeUser user =
    Encode.object
        [ ( "name", Encode.string user.name )
        , ( "age", Encode.int user.age )
        , ( "active", Encode.bool user.active )
        ]


userToString : User -> String
userToString user =
    Encode.encode 0 (encodeUser user)
