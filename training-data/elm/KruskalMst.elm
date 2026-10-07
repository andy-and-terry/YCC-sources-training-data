module KruskalMst exposing (Edge, minimumSpanningTree)

import Dict exposing (Dict)


type alias Edge =
    { from : Int
    , to : Int
    , weight : Int
    }


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


union : Dict Int Int -> Int -> Int -> ( Bool, Dict Int Int )
union parents x y =
    let
        rootX =
            find parents x

        rootY =
            find parents y
    in
    if rootX == rootY then
        ( False, parents )

    else
        ( True, Dict.insert rootX rootY parents )


minimumSpanningTree : Int -> List Edge -> List Edge
minimumSpanningTree nodeCount edges =
    let
        initialParents =
            List.range 0 (nodeCount - 1)
                |> List.map (\i -> ( i, i ))
                |> Dict.fromList

        sortedEdges =
            List.sortBy .weight edges

        step edge ( parents, accepted ) =
            let
                ( connected, updatedParents ) =
                    union parents edge.from edge.to
            in
            if connected then
                ( updatedParents, edge :: accepted )

            else
                ( parents, accepted )
    in
    sortedEdges
        |> List.foldl step ( initialParents, [] )
        |> Tuple.second
        |> List.reverse
