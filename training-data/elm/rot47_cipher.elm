module Rot47Cipher exposing (rot47)


rot47 : String -> String
rot47 =
    String.map
        (\c ->
            let
                n =
                    Char.toCode c
            in
            if n >= 33 && n <= 126 then
                Char.fromCode (33 + modBy 94 (n - 33 + 47))

            else
                c
        )
