-module(array_module_demo).
-export([run/0]).

run() ->
    A0 = array:new([{size, 5}, {default, 0}]),
    A1 = array:set(2, 42, A0),
    A2 = array:set(7, 99, A1),            % array grows automatically
    io:format("size: ~p~n", [array:size(A2)]),
    io:format("get 2: ~p~n", [array:get(2, A2)]),
    io:format("list: ~p~n", [array:to_list(A2)]),
    Sum = array:foldl(fun(_, V, Acc) -> V + Acc end, 0, A2),
    io:format("sum: ~p~n", [Sum]),
    Mapped = array:map(fun(_, V) -> V * 2 end, A1),
    io:format("mapped: ~p~n", [array:to_list(Mapped)]),
    io:format("sparse: ~p~n", [array:sparse_to_orddict(A2)]).
