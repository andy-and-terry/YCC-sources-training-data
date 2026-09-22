module JsonDecoderDemo exposing (Person, decodePerson, personDecoder)

import Json.Decode as Decode exposing (Decoder)


type alias Person =
    { name : String
    , age : Int
    , email : Maybe String
    }


personDecoder : Decoder Person
personDecoder =
    Decode.map3 Person
        (Decode.field "name" Decode.string)
        (Decode.field "age" Decode.int)
        (Decode.maybe (Decode.field "email" Decode.string))


decodePerson : String -> Result Decode.Error Person
decodePerson json =
    Decode.decodeString personDecoder json
