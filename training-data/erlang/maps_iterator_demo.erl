-module(maps_iterator_demo).
-export([run/0]).

run() ->
    M = #{apple => 3, pear => 5, kiwi => 1},
    io:format("~p~n", [maps:fold(fun(_, V, Acc) -> V + Acc end, 0, M)]),
    io:format("~p~n", [maps:filter(fun(_, V) -> V > 2 end, M)]),
    io:format("~p~n", [maps:map(fun(_, V) -> V * 10 end, M)]),
    io:format("~p~n", [lists:sort(maps:to_list(M))]),
    io:format("~p~n", [maps:with([apple, kiwi], M)]),
    io:format("~p~n", [maps:without([apple], M)]),
    M2 = M#{banana => 7, apple := 4},
    io:format("~p~n", [maps:get(apple, M2)]),
    io:format("~p~n", [maps:get(none, M2, default)]),
    It = maps:iterator(M),
    {K, V, _} = maps:next(It),
    io:format("first: ~p~n", [{K, V}]),
    io:format("~p~n", [maps:merge(M, #{apple => 0, fig => 2})]).
