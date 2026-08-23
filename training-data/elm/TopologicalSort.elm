module TopologicalSort exposing (topoSort)

import Dict exposing (Dict)
import Set exposing (Set)


type alias Graph =
    Dict String (List String)


topoSort : Graph -> List String
topoSort graph =
    let
        nodes =
            Dict.keys graph

        ( _, order ) =
            List.foldl (visitAll graph) ( Set.empty, [] ) nodes
    in
    order


visitAll : Graph -> String -> ( Set String, List String ) -> ( Set String, List String )
visitAll graph node ( visited, order ) =
    if Set.member node visited then
        ( visited, order )

    else
        let
            visited1 =
                Set.insert node visited

            deps =
                Dict.get node graph |> Maybe.withDefault []

            ( visited2, order2 ) =
                List.foldl (visitAll graph) ( visited1, order ) deps
        in
        ( visited2, node :: order2 )
