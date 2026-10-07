module BellmanFord exposing (Edge, shortestPaths)

import Dict exposing (Dict)


type alias Edge =
    ( String, String, Int )


infinity : Int
infinity =
    999999


shortestPaths : List String -> List Edge -> String -> Dict String Int
shortestPaths nodes edges source =
    let
        initial =
            nodes
                |> List.map (\n -> ( n, infinity ))
                |> Dict.fromList
                |> Dict.insert source 0
    in
    relaxAll edges (List.length nodes - 1) initial


relaxAll : List Edge -> Int -> Dict String Int -> Dict String Int
relaxAll edges count dist =
    if count <= 0 then
        dist

    else
        relaxAll edges (count - 1) (List.foldl relaxEdge dist edges)


relaxEdge : Edge -> Dict String Int -> Dict String Int
relaxEdge ( from, to, weight ) dist =
    let
        distFrom =
            Dict.get from dist |> Maybe.withDefault infinity

        distTo =
            Dict.get to dist |> Maybe.withDefault infinity
    in
    if distFrom /= infinity && distFrom + weight < distTo then
        Dict.insert to (distFrom + weight) dist

    else
        dist
