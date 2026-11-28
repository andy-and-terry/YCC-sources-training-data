module InsertInterval exposing (insertInterval)


insertInterval : List ( Int, Int ) -> ( Int, Int ) -> List ( Int, Int )
insertInterval intervals ( nlo, nhi ) =
    let
        before =
            List.filter (\( _, h ) -> h < nlo) intervals

        after =
            List.filter (\( l, _ ) -> l > nhi) intervals

        overlap =
            List.filter (\( l, h ) -> h >= nlo && l <= nhi) intervals

        lo =
            List.foldl (\( l, _ ) m -> min m l) nlo overlap

        hi =
            List.foldl (\( _, h ) m -> max m h) nhi overlap
    in
    before ++ [ ( lo, hi ) ] ++ after



-- insertInterval [ ( 1, 3 ), ( 6, 9 ) ] ( 2, 5 ) == [ ( 1, 5 ), ( 6, 9 ) ]
