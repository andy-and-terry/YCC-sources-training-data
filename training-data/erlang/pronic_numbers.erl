%% Pronic numbers n(n+1)
-module(PronicNumbers).
-export([main/0]).

term(N) -> N * (N + 1).

main() ->
    io:format("~p~n", [[term(N) || N <- lists:seq(0, 9)]]).
