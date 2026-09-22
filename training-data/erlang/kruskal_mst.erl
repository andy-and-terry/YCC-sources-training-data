-module(kruskal_mst).
-export([mst_weight/2]).

find(Parents, X) ->
    case maps:get(X, Parents) of
        X -> X;
        Parent -> find(Parents, Parent)
    end.

union(Parents, X, Y) ->
    RootX = find(Parents, X),
    RootY = find(Parents, Y),
    case RootX =:= RootY of
        true -> {false, Parents};
        false -> {true, maps:put(RootX, RootY, Parents)}
    end.

mst_weight(NumNodes, Edges) ->
    Sorted = lists:sort(fun({_, _, W1}, {_, _, W2}) -> W1 =< W2 end, Edges),
    Parents = maps:from_list([{I, I} || I <- lists:seq(0, NumNodes - 1)]),
    {TotalWeight, _} = lists:foldl(fun add_edge/2, {0, Parents}, Sorted),
    TotalWeight.

add_edge({From, To, Weight}, {Total, Parents}) ->
    case union(Parents, From, To) of
        {true, Parents1} -> {Total + Weight, Parents1};
        {false, _} -> {Total, Parents}
    end.
