module MoserDeBruijn exposing (moser, moserSequence)

import Bitwise

-- Moser-de Bruijn sequence: binary digits of n read in base 4.
-- moserSequence == [0,1,4,5,16,17,20,21,64,65,68,69]


moser : Int -> Int
moser n =
    if n == 0 then
        0

    else
        Bitwise.and n 1 + 4 * moser (Bitwise.shiftRightBy 1 n)


moserSequence : List Int
moserSequence =
    List.map moser (List.range 0 11)
