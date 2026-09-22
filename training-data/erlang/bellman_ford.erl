-module(bellman_ford).
-export([shortest_paths/3]).

shortest_paths(Nodes, Edges, Source) ->
    Dist0 = maps:from_list([{N, infinity} || N <- Nodes]),
    Dist1 = maps:put(Source, 0, Dist0),
    relax_all(Edges, Dist1, length(Nodes) - 1).

relax_all(_Edges, Dist, 0) -> Dist;
relax_all(Edges, Dist, Count) ->
    NewDist = lists:foldl(fun relax_edge/2, Dist, Edges),
    relax_all(Edges, NewDist, Count - 1).

relax_edge({U, V, W}, Dist) ->
    Du = maps:get(U, Dist),
    case Du of
        infinity -> Dist;
        _ ->
            Dv = maps:get(V, Dist, infinity),
            case Dv =:= infinity orelse Du + W < Dv of
                true -> maps:put(V, Du + W, Dist);
                false -> Dist
            end
    end.

main() ->
    Nodes = [a, b, c, d],
    Edges = [{a, b, 4}, {a, c, 5}, {b, c, -3}, {c, d, 4}, {b, d, 6}],
    io:format("~p~n", [shortest_paths(Nodes, Edges, a)]).
