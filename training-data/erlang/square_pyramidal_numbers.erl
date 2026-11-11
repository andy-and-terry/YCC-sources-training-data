%% Square pyramidal numbers n(n+1)(2n+1)/6
-module(SquarePyramidalNumbers).
-export([main/0]).

term(N) -> ((N * (N + 1)) * ((2 * N) + 1)) div 6.

main() ->
    io:format("~p~n", [[term(N) || N <- lists:seq(0, 9)]]).
