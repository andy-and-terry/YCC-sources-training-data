module EditDistance exposing (editDistance)


editDistance : String -> String -> Int
editDistance a b =
    distance (String.toList a) (String.toList b)


distance : List Char -> List Char -> Int
distance xs ys =
    case ( xs, ys ) of
        ( [], _ ) ->
            List.length ys

        ( _, [] ) ->
            List.length xs

        ( x :: xsRest, y :: ysRest ) ->
            if x == y then
                distance xsRest ysRest

            else
                1 + min3 (distance xsRest ys) (distance xs ysRest) (distance xsRest ysRest)


min3 : Int -> Int -> Int -> Int
min3 a b c =
    min a (min b c)
