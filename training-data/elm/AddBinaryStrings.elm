module AddBinaryStrings exposing (addBinary)


addBinary : String -> String -> String
addBinary a b =
    let
        n =
            max (String.length a) (String.length b)

        digits s =
            String.padLeft n '0' s
                |> String.toList
                |> List.reverse
                |> List.map (\c -> Char.toCode c - 48)

        step ( x, y ) ( carry, acc ) =
            let
                s =
                    x + y + carry
            in
            ( s // 2, String.fromInt (modBy 2 s) :: acc )

        ( finalCarry, bits ) =
            List.foldl step ( 0, [] ) (List.map2 Tuple.pair (digits a) (digits b))
    in
    String.concat
        (if finalCarry > 0 then
            "1" :: bits

         else
            bits
        )



-- addBinary "1010" "1011" == "10101"
