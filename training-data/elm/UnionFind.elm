module UnionFind exposing (find, init, union)

import Dict exposing (Dict)


init : Int -> Dict Int Int
init n =
    List.range 0 (n - 1)
        |> List.map (\i -> ( i, i ))
        |> Dict.fromList


find : Dict Int Int -> Int -> Int
find parents x =
    case Dict.get x parents of
        Just parent ->
            if parent == x then
                x

            else
                find parents parent

        Nothing ->
            x


union : Dict Int Int -> Int -> Int -> Dict Int Int
union parents x y =
    let
        rootX =
            find parents x

        rootY =
            find parents y
    in
    if rootX == rootY then
        parents

    else
        Dict.insert rootX rootY parents
