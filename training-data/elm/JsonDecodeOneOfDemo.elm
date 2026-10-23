module JsonDecodeOneOfDemo exposing (flexibleInt, decodeAll)

import Json.Decode as D


flexibleInt : D.Decoder Int
flexibleInt =
    D.oneOf
        [ D.int
        , D.string |> D.andThen parseString
        , D.null 0
        ]


parseString : String -> D.Decoder Int
parseString s =
    case String.toInt s of
        Just n ->
            D.succeed n

        Nothing ->
            D.fail ("not a number: " ++ s)


decodeAll : List String -> List (Result D.Error Int)
decodeAll inputs =
    List.map (D.decodeString flexibleInt) inputs
