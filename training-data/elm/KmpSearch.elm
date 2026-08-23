module KmpSearch exposing (indexOf)

import Array exposing (Array)


buildLps : String -> Array Int
buildLps pattern =
    let
        chars =
            Array.fromList (String.toList pattern)

        n =
            Array.length chars

        go i len lps =
            if i >= n then
                lps

            else
                case ( Array.get i chars, Array.get len chars ) of
                    ( Just a, Just b ) ->
                        if a == b then
                            go (i + 1) (len + 1) (Array.set i (len + 1) lps)

                        else if len /= 0 then
                            go i (Array.get (len - 1) lps |> Maybe.withDefault 0) lps

                        else
                            go (i + 1) 0 lps

                    _ ->
                        go (i + 1) 0 lps
    in
    go 1 0 (Array.repeat n 0)


indexOf : String -> String -> Int
indexOf text pattern =
    let
        textArr =
            Array.fromList (String.toList text)

        patArr =
            Array.fromList (String.toList pattern)

        lps =
            buildLps pattern

        n =
            Array.length textArr

        m =
            Array.length patArr

        search i j =
            if j == m then
                i - j

            else if i >= n then
                -1

            else
                case ( Array.get i textArr, Array.get j patArr ) of
                    ( Just a, Just b ) ->
                        if a == b then
                            search (i + 1) (j + 1)

                        else if j > 0 then
                            search i (Array.get (j - 1) lps |> Maybe.withDefault 0)

                        else
                            search (i + 1) 0

                    _ ->
                        -1
    in
    search 0 0
