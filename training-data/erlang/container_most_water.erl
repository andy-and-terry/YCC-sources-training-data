-module(container_most_water).
-export([run/0, max_area/1]).

max_area(Hs) ->
    T = list_to_tuple(Hs),
    go(T, 1, tuple_size(T), 0).

go(_T, Lo, Hi, Best) when Lo >= Hi -> Best;
go(T, Lo, Hi, Best) ->
    A = element(Lo, T),
    B = element(Hi, T),
    Best1 = max(Best, min(A, B) * (Hi - Lo)),
    case A < B of
        true -> go(T, Lo + 1, Hi, Best1);
        false -> go(T, Lo, Hi - 1, Best1)
    end.

run() ->
    io:format("~p~n", [max_area([1, 8, 6, 2, 5, 4, 8, 3, 7])]).
