-module(higher_order_lists_module).
-export([main/0]).

main() ->
    L = lists:seq(1, 10),
    io:format("~p~n", [lists:map(fun(X) -> X * 2 end, L)]),
    io:format("~p~n", [lists:filter(fun(X) -> X rem 3 =:= 0 end, L)]),
    io:format("~p~n", [lists:foldl(fun(X, Acc) -> X + Acc end, 0, L)]),
    io:format("~p~n", [lists:partition(fun(X) -> X > 5 end, L)]),
    io:format("~p~n", [lists:zip([a, b, c], [1, 2, 3])]),
    io:format("~p~n", [lists:sort(fun(A, B) -> A > B end, [3, 1, 2])]),
    io:format("~p~n", [lists:flatmap(fun(X) -> [X, X] end, [1, 2])]),
    io:format("~p~n", [lists:keyfind(b, 1, [{a, 1}, {b, 2}])]),
    io:format("~p~n", [{lists:max(L), lists:sum(L), lists:reverse([1, 2, 3]), lists:nth(2, L)}]),
    io:format("~p~n", [lists:splitwith(fun(X) -> X < 4 end, L)]).
