-module(lists_foreach_demo).
-export([main/0]).

main() ->
    lists:foreach(fun(X) -> io:format("item ~p~n", [X]) end, [a, b, c]),
    lists:foreach(
        fun({K, V}) -> io:format("~p => ~p~n", [K, V]) end,
        [{one, 1}, {two, 2}]
    ),
    Result = lists:foreach(fun(_) -> ok end, [1, 2, 3]),
    io:format("~p~n", [Result]).
