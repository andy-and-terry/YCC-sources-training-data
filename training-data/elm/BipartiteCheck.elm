module BipartiteCheck exposing (isBipartite)

import Dict exposing (Dict)


isBipartite : List comparable -> Dict comparable (List comparable) -> Bool
isBipartite nodes graph =
    checkAll nodes graph Dict.empty


checkAll : List comparable -> Dict comparable (List comparable) -> Dict comparable Int -> Bool
checkAll nodes graph colors =
    case nodes of
        [] ->
            True

        node :: rest ->
            if Dict.member node colors then
                checkAll rest graph colors

            else
                case bfs [ node ] graph (Dict.insert node 0 colors) of
                    Just updated ->
                        checkAll rest graph updated

                    Nothing ->
                        False


bfs : List comparable -> Dict comparable (List comparable) -> Dict comparable Int -> Maybe (Dict comparable Int)
bfs queue graph colors =
    case queue of
        [] ->
            Just colors

        node :: rest ->
            let
                neighbors =
                    Dict.get node graph |> Maybe.withDefault []

                nodeColor =
                    Dict.get node colors |> Maybe.withDefault 0

                step neighbor maybeState =
                    maybeState
                        |> Maybe.andThen
                            (\( c, extra ) ->
                                case Dict.get neighbor c of
                                    Nothing ->
                                        Just ( Dict.insert neighbor (1 - nodeColor) c, neighbor :: extra )

                                    Just other ->
                                        if other == nodeColor then
                                            Nothing

                                        else
                                            Just ( c, extra )
                            )
            in
            case List.foldl step (Just ( colors, [] )) neighbors of
                Nothing ->
                    Nothing

                Just ( updatedColors, newNodes ) ->
                    bfs (rest ++ newNodes) graph updatedColors
