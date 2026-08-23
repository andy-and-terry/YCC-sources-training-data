-module(dijkstra).
-export([shortest_paths/2]).

shortest_paths(Graph, Source) ->
    Nodes = maps:keys(Graph),
    Dist0 = maps:from_list([{N, infinity} || N <- Nodes]),
    Dist = maps:put(Source, 0, Dist0),
    visit(Graph, sets:new(), Dist).

visit(Graph, Visited, Dist) ->
    Unvisited = [
        {N, D} || {N, D} <- maps:to_list(Dist),
        not sets:is_element(N, Visited), D =/= infinity
    ],
    case Unvisited of
        [] -> Dist;
        _ ->
            {Node, NodeDist} = lists:foldl(
                fun({N, D}, {BN, BD}) ->
                    case D < BD of
                        true -> {N, D};
                        false -> {BN, BD}
                    end
                end,
                hd(Unvisited),
                tl(Unvisited)
            ),
            Visited1 = sets:add_element(Node, Visited),
            Neighbors = maps:get(Node, Graph, []),
            Dist1 = lists:foldl(
                fun({Neighbor, Weight}, Acc) ->
                    NewDist = NodeDist + Weight,
                    case NewDist < maps:get(Neighbor, Acc, infinity) of
                        true -> maps:put(Neighbor, NewDist, Acc);
                        false -> Acc
                    end
                end,
                Dist,
                Neighbors
            ),
            visit(Graph, Visited1, Dist1)
    end.
