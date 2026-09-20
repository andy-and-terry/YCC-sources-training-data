module KruskalMst exposing (Edge, kruskalMst)

import Dict exposing (Dict)


type alias Edge =
    { from : Int, to : Int, weight : Int }


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
union parents rootX rootY =
    Dict.insert rootX rootY parents


kruskalMst : Int -> List Edge -> List Edge
kruskalMst nodeCount edges =
    let
        initialParents =
            List.range 0 (nodeCount - 1)
                |> List.map (\i -> ( i, i ))
                |> Dict.fromList

        sortedEdges =
            List.sortBy .weight edges

        step edge ( parents, acc ) =
            let
                rootFrom =
                    find parents edge.from

                rootTo =
                    find parents edge.to
            in
            if rootFrom == rootTo then
                ( parents, acc )

            else
                ( union parents rootFrom rootTo, edge :: acc )

        ( _, mst ) =
            List.foldl step ( initialParents, [] ) sortedEdges
    in
    List.reverse mst
