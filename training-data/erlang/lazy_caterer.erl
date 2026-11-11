%% Lazy caterer sequence: max pieces from n cuts
-module(LazyCaterer).
-export([main/0]).

term(N) -> ((N * (N + 1)) div 2) + 1.

main() ->
    io:format("~p~n", [[term(N) || N <- lists:seq(0, 9)]]).
