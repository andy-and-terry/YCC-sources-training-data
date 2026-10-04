-module(pascal_triangle).
-export([rows/1, run/0]).

next_row(Row) ->
    lists:zipwith(fun(A, B) -> A + B end, [0 | Row], Row ++ [0]).

rows(N) when N > 0 ->
    lists:reverse(build(N - 1, [[1]])).

build(0, Acc) -> Acc;
build(N, [Last | _] = Acc) -> build(N - 1, [next_row(Last) | Acc]).

run() ->
    lists:foreach(fun(R) -> io:format("~w~n", [R]) end, rows(6)).
