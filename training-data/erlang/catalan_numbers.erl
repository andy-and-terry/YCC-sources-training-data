-module(catalan_numbers).
-export([catalan/1]).

catalan(N) ->
    lists:foldl(fun(I, Acc) -> Acc ++ [compute(I, Acc)] end, [1], lists:seq(1, N)).

compute(I, Acc) ->
    lists:sum([lists:nth(J + 1, Acc) * lists:nth(I - J, Acc) || J <- lists:seq(0, I - 1)]).
