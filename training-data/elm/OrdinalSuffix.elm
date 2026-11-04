module OrdinalSuffix exposing (ordinal)


ordinal : Int -> String
ordinal n =
    let
        r100 =
            modBy 100 n

        suffix =
            if r100 >= 11 && r100 <= 13 then
                "th"

            else
                case modBy 10 n of
                    1 ->
                        "st"

                    2 ->
                        "nd"

                    3 ->
                        "rd"

                    _ ->
                        "th"
    in
    String.fromInt n ++ suffix
