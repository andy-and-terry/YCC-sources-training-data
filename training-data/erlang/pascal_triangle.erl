-module(pascal_triangle).
-export([rows/1, run/0]).

next_row(Row) ->
    lists:zipwith(fun(A, B) -> A + B end, [0 | Row], Row ++ [0]).

rows(N) when N > 0 ->
    rows(N, [[1]]).

rows(1, Acc) -> lists:reverse(Acc);
rows(N, [Last | _] = Acc) -> rows(N - 1, [next_row(Last) | Acc]).

run() ->
    lists:foreach(fun(Row) -> io:format("~p~n", [Row]) end, rows(6)).
