-module(lists_all_any_demo).
-export([main/0]).

main() ->
    Nums = [2, 4, 6, 7],
    io:format("~p~n", [lists:all(fun(N) -> N rem 2 =:= 0 end, Nums)]),
    io:format("~p~n", [lists:any(fun(N) -> N rem 2 =:= 1 end, Nums)]),
    io:format("~p~n", [lists:all(fun(_) -> false end, [])]),
    io:format("~p~n", [lists:any(fun(_) -> true end, [])]),
    io:format("~p~n", [lists:member(4, Nums)]).
