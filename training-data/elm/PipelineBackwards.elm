module PipelineBackwards exposing (lengthOfLongest, sumOfSquares)


sumOfSquares : List Int -> Int
sumOfSquares nums =
    List.sum <| List.map (\n -> n * n) nums


lengthOfLongest : List String -> Int
lengthOfLongest words =
    Maybe.withDefault 0 <| List.maximum <| List.map String.length words
