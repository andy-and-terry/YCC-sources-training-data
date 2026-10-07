module KruskalMST exposing (Edge, minimumSpanningTree)

import Dict exposing (Dict)


type alias Edge =
    { from : Int
    , to : Int
    , weight : Int
    }


minimumSpanningTree : Int -> List Edge -> List Edge
minimumSpanningTree vertexCount edges =
    edges
        |> List.sortBy .weight
        |> List.foldl pickEdge ( initParents vertexCount, [] )
        |> Tuple.second
        |> List.reverse


initParents : Int -> Dict Int Int
initParents vertexCount =
    List.range 0 (vertexCount - 1)
        |> List.map (\v -> ( v, v ))
        |> Dict.fromList


find : Dict Int Int -> Int -> Int
find parents vertex =
    case Dict.get vertex parents of
        Just parent ->
            if parent == vertex then
                vertex

            else
                find parents parent

        Nothing ->
            vertex


pickEdge : Edge -> ( Dict Int Int, List Edge ) -> ( Dict Int Int, List Edge )
pickEdge edge ( parents, accepted ) =
    let
        rootFrom =
            find parents edge.from

        rootTo =
            find parents edge.to
    in
    if rootFrom == rootTo then
        ( parents, accepted )

    else
        ( Dict.insert rootFrom rootTo parents, edge :: accepted )
