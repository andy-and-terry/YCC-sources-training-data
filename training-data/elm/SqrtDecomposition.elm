module SqrtDecomposition exposing (main)

import Array
import Html exposing (text)


query : Int -> Array.Array Int -> Array.Array Int -> Int -> Int -> Int -> Int
query bs a blk i r acc =
    if i > r then
        acc

    else if modBy bs i == 0 && i + bs - 1 <= r then
        query bs a blk (i + bs) r (acc + Maybe.withDefault 0 (Array.get (i // bs) blk))

    else
        query bs a blk (i + 1) r (acc + Maybe.withDefault 0 (Array.get i a))


main =
    let
        xs = [ 5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5 ]
        blocks = [ 17, 22, 14 ]
    in
    text (String.fromInt (query 4 (Array.fromList xs) (Array.fromList blocks) 2 9 0))
