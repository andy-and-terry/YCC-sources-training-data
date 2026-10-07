module ZipListDemo exposing (pairUp, sumPairwise)


pairUp : List a -> List b -> List ( a, b )
pairUp xs ys =
    List.map2 Tuple.pair xs ys


sumPairwise : List Int -> List Int -> List Int
sumPairwise xs ys =
    List.map2 (+) xs ys
