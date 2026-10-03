module GenerateParentheses exposing (generate)


generate : Int -> List String
generate n =
    backtrack "" 0 0 n


backtrack : String -> Int -> Int -> Int -> List String
backtrack current open close max =
    if String.length current == max * 2 then
        [ current ]

    else
        let
            withOpen =
                if open < max then
                    backtrack (current ++ "(") (open + 1) close max

                else
                    []

            withClose =
                if close < open then
                    backtrack (current ++ ")") open (close + 1) max

                else
                    []
        in
        withOpen ++ withClose
