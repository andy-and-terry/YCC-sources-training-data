module RepunitNumbers exposing (repunits)

-- Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
-- repunits 8 == [ 1, 11, 111, 1111, 11111, 111111, 1111111, 11111111 ]


repunits : Int -> List Int
repunits count =
    let
        go k r acc =
            if k == 0 then
                List.reverse acc

            else
                go (k - 1) (r * 10 + 1) (r :: acc)
    in
    go count 1 []
