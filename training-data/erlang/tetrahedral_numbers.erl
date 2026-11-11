%% Tetrahedral numbers n(n+1)(n+2)/6
-module(TetrahedralNumbers).
-export([main/0]).

term(N) -> ((N * (N + 1)) * (N + 2)) div 6.

main() ->
    io:format("~p~n", [[term(N) || N <- lists:seq(0, 9)]]).
