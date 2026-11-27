module Fletcher16Checksum exposing (fletcher16)

import Bitwise


fletcher16 : String -> Int
fletcher16 text =
    let
        step c ( s1, s2 ) =
            let
                a =
                    modBy 255 (s1 + Char.toCode c)
            in
            ( a, modBy 255 (s2 + a) )

        ( r1, r2 ) =
            String.foldl step ( 0, 0 ) text
    in
    Bitwise.or (Bitwise.shiftLeftBy 8 r2) r1
