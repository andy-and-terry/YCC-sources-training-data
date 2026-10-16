module JsonOptionalFieldDemo exposing (Profile, decodeProfile)

import Json.Decode as Decode exposing (Decoder)


type alias Profile =
    { name : String
    , nickname : Maybe String
    , age : Int
    }


decodeProfile : Decoder Profile
decodeProfile =
    Decode.map3 Profile
        (Decode.field "name" Decode.string)
        (Decode.maybe (Decode.field "nickname" Decode.string))
        (Decode.oneOf
            [ Decode.field "age" Decode.int
            , Decode.succeed 0
            ]
        )
