module FloydWarshall exposing (allPairsShortestPaths)

import Dict exposing (Dict)


type alias Edge =
    ( String, String, Int )


infinity : Int
infinity =
    999999


allPairsShortestPaths : List String -> List Edge -> Dict ( String, String ) Int
allPairsShortestPaths nodes edges =
    let
        initial =
            List.foldl
                (\a acc ->
                    List.foldl
                        (\b acc2 ->
                            Dict.insert ( a, b )
                                (if a == b then
                                    0

                                 else
                                    infinity
                                )
                                acc2
                        )
                        acc
                        nodes
                )
                Dict.empty
                nodes

        withEdges =
            List.foldl (\( a, b, w ) acc -> Dict.insert ( a, b ) w acc) initial edges
    in
    List.foldl (relax nodes) withEdges nodes


relax : List String -> String -> Dict ( String, String ) Int -> Dict ( String, String ) Int
relax nodes k dist =
    List.foldl
        (\i acc ->
            List.foldl
                (\j acc2 ->
                    let
                        ik =
                            Dict.get ( i, k ) acc2 |> Maybe.withDefault infinity

                        kj =
                            Dict.get ( k, j ) acc2 |> Maybe.withDefault infinity

                        ij =
                            Dict.get ( i, j ) acc2 |> Maybe.withDefault infinity
                    in
                    if ik + kj < ij then
                        Dict.insert ( i, j ) (ik + kj) acc2

                    else
                        acc2
                )
                acc
                nodes
        )
        dist
        nodes
