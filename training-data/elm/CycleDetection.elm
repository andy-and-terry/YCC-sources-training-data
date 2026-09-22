module CycleDetection exposing (Graph, hasCycle)

import Dict exposing (Dict)
import Set exposing (Set)


type alias Graph =
    Dict String (List String)


hasCycle : Graph -> Bool
hasCycle graph =
    let
        nodes =
            Dict.keys graph

        ( _, _, found ) =
            List.foldl (visit graph) ( Set.empty, Set.empty, False ) nodes
    in
    found


visit : Graph -> String -> ( Set String, Set String, Bool ) -> ( Set String, Set String, Bool )
visit graph node ( visited, onStack, found ) =
    if found then
        ( visited, onStack, found )

    else if Set.member node visited then
        ( visited, onStack, found )

    else
        explore graph node ( visited, onStack, found )


explore : Graph -> String -> ( Set String, Set String, Bool ) -> ( Set String, Set String, Bool )
explore graph node ( visited, onStack, found ) =
    let
        visited1 =
            Set.insert node visited

        onStack1 =
            Set.insert node onStack

        neighbors =
            Dict.get node graph |> Maybe.withDefault []

        ( visited2, onStack2, found2 ) =
            List.foldl (step graph) ( visited1, onStack1, found ) neighbors
    in
    ( visited2, Set.remove node onStack2, found2 )


step : Graph -> String -> ( Set String, Set String, Bool ) -> ( Set String, Set String, Bool )
step graph neighbor ( visited, onStack, found ) =
    if found then
        ( visited, onStack, found )

    else if Set.member neighbor onStack then
        ( visited, onStack, True )

    else if Set.member neighbor visited then
        ( visited, onStack, found )

    else
        explore graph neighbor ( visited, onStack, found )
