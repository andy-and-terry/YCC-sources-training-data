-module(floyd_warshall).
-export([shortest_paths/2]).

shortest_paths(Nodes, Edges) ->
    Dist = init_dist(Nodes, Edges),
    lists:foldl(fun(K, Acc) -> relax_via(Nodes, K, Acc) end, Dist, Nodes).

init_dist(Nodes, Edges) ->
    Base = maps:from_list([
        {{I, J}, case I =:= J of true -> 0; false -> infinity end}
        || I <- Nodes, J <- Nodes
    ]),
    lists:foldl(fun({U, V, W}, Acc) -> maps:put({U, V}, W, Acc) end, Base, Edges).

relax_via(Nodes, K, Dist) ->
    lists:foldl(
        fun(I, Acc1) ->
            lists:foldl(
                fun(J, Acc2) ->
                    Dik = maps:get({I, K}, Acc2),
                    Dkj = maps:get({K, J}, Acc2),
                    Dij = maps:get({I, J}, Acc2),
                    case Dik =/= infinity andalso Dkj =/= infinity andalso Dik + Dkj < Dij of
                        true -> maps:put({I, J}, Dik + Dkj, Acc2);
                        false -> Acc2
                    end
                end,
                Acc1,
                Nodes
            )
        end,
        Dist,
        Nodes
    ).

main() ->
    Nodes = [a, b, c, d],
    Edges = [{a, b, 3}, {a, c, 8}, {b, d, 1}, {c, d, 2}, {d, a, 4}],
    Dist = shortest_paths(Nodes, Edges),
    io:format("~p~n", [maps:get({a, d}, Dist)]),
    io:format("~p~n", [maps:get({c, a}, Dist)]).
