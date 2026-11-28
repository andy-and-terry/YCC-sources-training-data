module AffineCipher exposing (encrypt)

import Char


encrypt : Int -> Int -> String -> String
encrypt a b =
    String.map
        (\ch ->
            if Char.isUpper ch then
                let
                    x =
                        Char.toCode ch - 65
                in
                Char.fromCode (modBy 26 (a * x + b) + 65)

            else
                ch
        )
