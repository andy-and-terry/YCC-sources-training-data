module ListUnzipPairs exposing (splitPairs, zipSum)


splitPairs : List ( String, Int ) -> ( List String, List Int )
splitPairs pairs =
    List.unzip pairs


zipSum : List Int -> List Int -> List Int
zipSum xs ys =
    List.map2 (+) xs ys
