-module(maps_operations_module).
-export([main/0]).

main() ->
    M = #{a => 1, b => 2},
    M2 = M#{c => 3, a := 10},
    io:format("~p ~p~n", [M2, maps:get(b, M2)]),
    io:format("~p ~p~n", [maps:keys(M2), maps:values(M2)]),
    io:format("~p~n", [maps:fold(fun(_K, V, Acc) -> V + Acc end, 0, M2)]),
    io:format("~p~n", [maps:map(fun(_K, V) -> V * 2 end, M2)]),
    io:format("~p ~p~n", [maps:find(z, M2), maps:is_key(a, M2)]),
    io:format("~p~n", [maps:to_list(maps:filter(fun(_K, V) -> V > 2 end, M2))]),
    #{a := A} = M2,
    io:format("~p~n", [A]).
