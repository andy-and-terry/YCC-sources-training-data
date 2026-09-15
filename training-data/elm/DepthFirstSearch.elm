module DepthFirstSearch exposing (dfs)

import Dict exposing (Dict)


type alias Graph =
    Dict String (List String)


dfs : Graph -> String -> List String
dfs graph start =
    List.reverse (Tuple.second (visit graph start ( [ start ], [] )))


visit : Graph -> String -> ( List String, List String ) -> ( List String, List String )
visit graph node ( visited, order ) =
    let
        neighbors =
            Dict.get node graph |> Maybe.withDefault []
    in
    List.foldl
        (\neighbor ( vAcc, oAcc ) ->
            if List.member neighbor vAcc then
                ( vAcc, oAcc )

            else
                visit graph neighbor ( neighbor :: vAcc, oAcc )
        )
        ( visited, node :: order )
        neighbors
