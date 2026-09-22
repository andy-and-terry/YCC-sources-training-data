module JsonDecodeDemo exposing (User, decodeUser, userDecoder)

import Json.Decode as Decode exposing (Decoder)


type alias User =
    { name : String
    , age : Int
    }


userDecoder : Decoder User
userDecoder =
    Decode.map2 User
        (Decode.field "name" Decode.string)
        (Decode.field "age" Decode.int)


decodeUser : String -> Result Decode.Error User
decodeUser json =
    Decode.decodeString userDecoder json
