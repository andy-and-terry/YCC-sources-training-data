module VowelCounter exposing (countVowels)


countVowels : String -> List ( Char, Int )
countVowels s =
    let
        lower =
            String.toList (String.toLower s)
    in
    List.map (\v -> ( v, List.length (List.filter ((==) v) lower) )) (String.toList "aeiou")
