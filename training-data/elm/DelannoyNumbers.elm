module DelannoyNumbers exposing (main)

import Html


{-| D(m, n) = D(m-1, n) + D(m, n-1) + D(m-1, n-1)
-}
delannoy : Int -> Int -> Int
delannoy m n =
    if m == 0 || n == 0 then
        1

    else
        delannoy (m - 1) n + delannoy m (n - 1) + delannoy (m - 1) (n - 1)


main : Html.Html msg
main =
    Html.text (String.join " " (List.map (\n -> String.fromInt (delannoy n n)) (List.range 0 5)))



-- 1 3 13 63 321 1683
