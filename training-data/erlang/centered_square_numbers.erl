%% Centered square numbers 2n(n+1)+1
-module(CenteredSquareNumbers).
-export([main/0]).

term(N) -> ((2 * N) * (N + 1)) + 1.

main() ->
    io:format("~p~n", [[term(N) || N <- lists:seq(0, 9)]]).
