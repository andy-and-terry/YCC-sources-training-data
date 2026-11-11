%% Repunits: numbers made only of the digit 1.
-module(repunit_numbers).
-export([main/0]).

repunits(0, _) -> [];
repunits(N, R) -> NewR = R * 10 + 1, [NewR | repunits(N - 1, NewR)].

main() -> io:format("~p~n", [repunits(5, 0)]).
