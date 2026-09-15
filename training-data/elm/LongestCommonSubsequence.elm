module LongestCommonSubsequence exposing (lcs)


lcs : String -> String -> String
lcs a b =
    String.fromList (lcsChars (String.toList a) (String.toList b))


lcsChars : List Char -> List Char -> List Char
lcsChars xs ys =
    case ( xs, ys ) of
        ( [], _ ) ->
            []

        ( _, [] ) ->
            []

        ( x :: xsRest, y :: ysRest ) ->
            if x == y then
                x :: lcsChars xsRest ysRest

            else
                let
                    withoutX =
                        lcsChars xsRest ys

                    withoutY =
                        lcsChars xs ysRest
                in
                if List.length withoutX >= List.length withoutY then
                    withoutX

                else
                    withoutY
