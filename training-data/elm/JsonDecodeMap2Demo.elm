module JsonDecodeMap2Demo exposing (Point, decodePoint, decodeList)

import Json.Decode as Decode exposing (Decoder)


type alias Point =
    { x : Float
    , y : Float
    }


decodePoint : Decoder Point
decodePoint =
    Decode.map2 Point
        (Decode.field "x" Decode.float)
        (Decode.field "y" Decode.float)


decodeList : Decoder (List Point)
decodeList =
    Decode.field "points" (Decode.list decodePoint)
