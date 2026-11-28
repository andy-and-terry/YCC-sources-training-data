-module(gould_sequence).
-export([main/0]).

popcount(0) -> 0;
popcount(N) -> (N band 1) + popcount(N bsr 1).

gould(N) -> 1 bsl popcount(N).

main() ->
    io:format("~p~n", [[gould(N) || N <- lists:seq(0, 15)]]).
