module RecamanSequence exposing (recaman)

import Set exposing (Set)


recaman : Int -> List Int
recaman count =
    let
        step i ( prev, seen, acc ) =
            let
                candidate =
                    prev - i

                next =
                    if candidate > 0 && not (Set.member candidate seen) then
                        candidate

                    else
                        prev + i
            in
            ( next, Set.insert next seen, next :: acc )

        ( _, _, reversed ) =
            List.foldl step ( 0, Set.singleton 0, [ 0 ] ) (List.range 1 (count - 1))
    in
    List.reverse reversed



-- recaman 20 == [0,1,3,6,2,7,13,20,12,21,11,22,10,23,9,24,8,25,43,62]
