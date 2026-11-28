module JaccardSimilarity exposing (jaccard)

import Set exposing (Set)


jaccard : Set comparable -> Set comparable -> Float
jaccard a b =
    let
        u =
            Set.size (Set.union a b)
    in
    if u == 0 then
        1

    else
        toFloat (Set.size (Set.intersect a b)) / toFloat u
