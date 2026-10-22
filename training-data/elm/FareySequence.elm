module FareySequence exposing (farey, show)


farey : Int -> List ( Int, Int )
farey n =
    let
        go ( a, b ) ( c, d ) acc =
            if a == 1 && b == 1 then
                List.reverse (( a, b ) :: acc)

            else
                let
                    k =
                        (n + b) // d
                in
                go ( c, d ) ( k * c - a, k * d - b ) (( a, b ) :: acc)
    in
    go ( 0, 1 ) ( 1, n ) []


show : List ( Int, Int ) -> String
show fractions =
    fractions
        |> List.map (\( a, b ) -> String.fromInt a ++ "/" ++ String.fromInt b)
        |> String.join " "



-- show (farey 5) == "0/1 1/5 1/4 1/3 2/5 1/2 3/5 2/3 3/4 4/5 1/1"
