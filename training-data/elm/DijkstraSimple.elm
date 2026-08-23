module DijkstraSimple exposing (shortestPaths)

import Dict exposing (Dict)


type alias Graph =
    Dict String (List ( String, Int ))


shortestPaths : Graph -> String -> Dict String Int
shortestPaths graph source =
    let
        nodes =
            Dict.keys graph

        initial =
            nodes
                |> List.map (\n -> ( n, 999999 ))
                |> Dict.fromList
                |> Dict.insert source 0
    in
    visit graph [] initial


visit : Graph -> List String -> Dict String Int -> Dict String Int
visit graph visited dist =
    let
        candidate =
            dist
                |> Dict.toList
                |> List.filter (\( k, _ ) -> not (List.member k visited))
                |> List.sortBy Tuple.second
                |> List.head
    in
    case candidate of
        Nothing ->
            dist

        Just ( node, nodeDist ) ->
            let
                neighbors =
                    Dict.get node graph |> Maybe.withDefault []

                newDist =
                    List.foldl
                        (\( neighbor, weight ) acc ->
                            let
                                candidateDist =
                                    nodeDist + weight

                                current =
                                    Dict.get neighbor acc |> Maybe.withDefault 999999
                            in
                            if candidateDist < current then
                                Dict.insert neighbor candidateDist acc

                            else
                                acc
                        )
                        dist
                        neighbors
            in
            visit graph (node :: visited) newDist
