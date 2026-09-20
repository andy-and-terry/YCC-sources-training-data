module BellmanFord exposing (Edge, hasNegativeCycle, shortestPaths)

import Dict exposing (Dict)


type alias Edge =
    { from : String, to : String, weight : Int }


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

        relaxOnce dist =
            List.foldl relaxEdge dist edges

        iterate n dist =
            if n <= 0 then
                dist

            else
                iterate (n - 1) (relaxOnce dist)
    in
    iterate (List.length nodes - 1) initial


relaxEdge : Edge -> Dict String Int -> Dict String Int
relaxEdge edge dist =
    let
        du =
            Dict.get edge.from dist |> Maybe.withDefault infinity

        dv =
            Dict.get edge.to dist |> Maybe.withDefault infinity
    in
    if du /= infinity && du + edge.weight < dv then
        Dict.insert edge.to (du + edge.weight) dist

    else
        dist


{-| Run one extra relaxation pass after convergence; if any distance still
improves, the graph contains a negative-weight cycle reachable from source.
-}
hasNegativeCycle : List String -> List Edge -> String -> Bool
hasNegativeCycle nodes edges source =
    let
        converged =
            shortestPaths nodes edges source

        relaxedOnceMore =
            List.foldl relaxEdge converged edges
    in
    relaxedOnceMore /= converged
