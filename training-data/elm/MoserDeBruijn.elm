module MoserDeBruijn exposing (main)

import Bitwise
import Html


{-| Read the binary digits of i as base-4 digits.
-}
moser : Int -> Int
moser i =
    if i == 0 then
        0

    else
        Bitwise.and i 1 + 4 * moser (Bitwise.shiftRightBy 1 i)


main : Html.Html msg
main =
    List.range 0 9
        |> List.map (moser >> String.fromInt)
        |> String.join " "
        |> Html.text



-- 0 1 4 5 16 17 20 21 64 65
