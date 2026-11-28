-module(pronic_numbers).
-export([main/0]).

is_pronic(X) ->
    N = trunc(math:sqrt(X)),
    N * (N + 1) =:= X.

main() ->
    io:format("~p~n", [[N * (N + 1) || N <- lists:seq(0, 9)]]),   %% [0,2,6,12,20,30,42,56,72,90]
    io:format("~p ~p~n", [is_pronic(56), is_pronic(57)]).          %% true false
