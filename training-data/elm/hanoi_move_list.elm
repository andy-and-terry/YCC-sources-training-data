module HanoiMoveList exposing (hanoi)


hanoi : Int -> String -> String -> String -> List ( String, String )
hanoi n a b c =
    if n == 0 then
        []

    else
        hanoi (n - 1) a c b ++ [ ( a, c ) ] ++ hanoi (n - 1) b a c
