-module(triangle_min_path).
-export([run/0, minimum_total/1]).

minimum_total(Rows) ->
    [Bottom | Rest] = lists:reverse(Rows),
    [Best] = lists:foldl(fun step/2, Bottom, Rest),
    Best.

step(Row, Below) ->
    Pairs = lists:zip(Below, tl(Below)),
    [V + min(L, R) || {V, {L, R}} <- lists:zip(Row, Pairs)].

run() ->
    io:format("~p~n", [minimum_total([[2], [3, 4], [6, 5, 7], [4, 1, 8, 3]])]).
