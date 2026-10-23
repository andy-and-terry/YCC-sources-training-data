-module(ets_foldl_demo).
-export([run/0]).

run() ->
    T = ets:new(scores, [set]),
    ets:insert(T, [{ann, 10}, {bob, 25}, {cy, 7}]),
    Total = ets:foldl(fun({_, S}, Acc) -> S + Acc end, 0, T),
    io:format("total ~p~n", [Total]),
    Names = lists:sort(ets:foldl(fun({N, _}, Acc) -> [N | Acc] end, [], T)),
    io:format("names ~p~n", [Names]),
    ets:update_counter(T, ann, 5),
    io:format("ann ~p~n", [ets:lookup(T, ann)]),
    io:format("size ~p~n", [ets:info(T, size)]),
    ets:delete(T).
