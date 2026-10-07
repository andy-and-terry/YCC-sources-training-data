module ParserDemo exposing (Point, parsePoint)

import Parser exposing ((|.), (|=), Parser)


type alias Point =
    { x : Int, y : Int }


signedInt : Parser Int
signedInt =
    Parser.oneOf
        [ Parser.succeed negate
            |. Parser.symbol "-"
            |= Parser.int
        , Parser.int
        ]


point : Parser Point
point =
    Parser.succeed Point
        |. Parser.symbol "("
        |. Parser.spaces
        |= signedInt
        |. Parser.spaces
        |. Parser.symbol ","
        |. Parser.spaces
        |= signedInt
        |. Parser.spaces
        |. Parser.symbol ")"
        |. Parser.end


parsePoint : String -> Maybe Point
parsePoint input =
    Parser.run point input
        |> Result.toMaybe


-- parsePoint "(3, -4)" == Just { x = 3, y = -4 }
-- parsePoint "(3 4)" == Nothing
