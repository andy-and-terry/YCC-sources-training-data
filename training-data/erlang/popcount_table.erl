%% Population count (number of set bits) for 0..15
-module(PopcountTable).
-export([main/0]).

bits(0) -> 0;
bits(N) -> (N band 1) + bits(N bsr 1).

main() ->
    io:format("~p~n", [[bits(N) || N <- lists:seq(0, 15)]]).
