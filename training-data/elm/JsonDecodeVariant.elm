module JsonDecodeVariant exposing (Shape(..), decodeShape, shapeDecoder)

import Json.Decode as Decode exposing (Decoder)


type Shape
    = Circle Float
    | Rectangle Float Float


shapeDecoder : Decoder Shape
shapeDecoder =
    Decode.field "kind" Decode.string
        |> Decode.andThen shapeByKind


shapeByKind : String -> Decoder Shape
shapeByKind kind =
    case kind of
        "circle" ->
            Decode.map Circle (Decode.field "radius" Decode.float)

        "rectangle" ->
            Decode.map2 Rectangle
                (Decode.field "width" Decode.float)
                (Decode.field "height" Decode.float)

        _ ->
            Decode.fail ("unknown shape kind: " ++ kind)


decodeShape : String -> Result Decode.Error Shape
decodeShape json =
    Decode.decodeString shapeDecoder json
