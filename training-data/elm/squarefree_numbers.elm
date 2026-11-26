module SquarefreeNumbers exposing (main)

-- Squarefree numbers up to 100; expect 61.

import Html exposing (text)


squarefree : Int -> Bool
squarefree n =
    List.all (\d -> modBy (d * d) n /= 0) (List.range 2 (floor (sqrt (toFloat n))))



main =
    text (Debug.toString (List.length (List.filter squarefree (List.range 1 100))))
