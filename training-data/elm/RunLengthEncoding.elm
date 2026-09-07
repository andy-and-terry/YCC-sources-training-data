module RunLengthEncoding exposing (decode, encode)


encode : String -> String
encode str =
    str
        |> String.toList
        |> group
        |> List.map (\( c, n ) -> String.fromInt n ++ String.fromChar c)
        |> String.concat


group : List Char -> List ( Char, Int )
group chars =
    case chars of
        [] ->
            []

        c :: rest ->
            groupHelp c 1 rest


groupHelp : Char -> Int -> List Char -> List ( Char, Int )
groupHelp current count chars =
    case chars of
        [] ->
            [ ( current, count ) ]

        c :: rest ->
            if c == current then
                groupHelp current (count + 1) rest

            else
                ( current, count ) :: groupHelp c 1 rest


decode : String -> String
decode str =
    decodeHelp (String.toList str)


decodeHelp : List Char -> String
decodeHelp chars =
    case chars of
        [] ->
            ""

        _ ->
            let
                ( digits, rest1 ) =
                    span Char.isDigit chars

                letter =
                    List.head rest1 |> Maybe.withDefault ' '

                rest2 =
                    List.drop 1 rest1

                count =
                    digits |> String.fromList |> String.toInt |> Maybe.withDefault 0
            in
            String.repeat count (String.fromChar letter) ++ decodeHelp rest2


span : (Char -> Bool) -> List Char -> ( List Char, List Char )
span pred chars =
    case chars of
        [] ->
            ( [], [] )

        c :: rest ->
            if pred c then
                let
                    ( taken, remaining ) =
                        span pred rest
                in
                ( c :: taken, remaining )

            else
                ( [], chars )
