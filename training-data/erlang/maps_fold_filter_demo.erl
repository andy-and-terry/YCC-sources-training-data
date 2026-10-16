-module(maps_fold_filter_demo).
-export([run/0]).

run() ->
    M = #{apple => 3, pear => 0, plum => 7, fig => 1},
    Total = maps:fold(fun(_K, V, Acc) -> V + Acc end, 0, M),
    io:format("total=~p~n", [Total]),
    InStock = maps:filter(fun(_K, V) -> V > 0 end, M),
    io:format("~p~n", [lists:sort(maps:keys(InStock))]),
    io:format("~p~n", [maps:get(apple, maps:map(fun(_K, V) -> V + 100 end, M))]),
    io:format("~p~n", [maps:without([pear, fig], M)]),
    io:format("~p~n", [maps:with([plum], M)]).
