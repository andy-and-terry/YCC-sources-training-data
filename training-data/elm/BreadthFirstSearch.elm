module BreadthFirstSearch exposing (bfs)

import Dict exposing (Dict)


type alias Graph =
    Dict String (List String)


bfs : Graph -> String -> List String
bfs graph start =
    bfsLoop graph [ start ] [ start ] []


bfsLoop : Graph -> List String -> List String -> List String -> List String
bfsLoop graph queue visited order =
    case queue of
        [] ->
            List.reverse order

        node :: rest ->
            let
                neighbors =
                    Dict.get node graph |> Maybe.withDefault []

                newNeighbors =
                    List.filter (\n -> not (List.member n visited)) neighbors

                newQueue =
                    rest ++ newNeighbors

                newVisited =
                    visited ++ newNeighbors
            in
            bfsLoop graph newQueue newVisited (node :: order)
