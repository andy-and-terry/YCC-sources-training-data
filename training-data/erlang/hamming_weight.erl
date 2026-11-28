-module(hamming_weight).
-export([main/0]).

popcount(0) -> 0;
popcount(N) -> 1 + popcount(N band (N - 1)).

main() -> io:format("~p~n", [popcount(2#10110111)]).
