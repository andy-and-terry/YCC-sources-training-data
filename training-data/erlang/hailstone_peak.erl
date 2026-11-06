%% Highest value reached by the Collatz (hailstone) sequence from N.
-module(hailstone_peak).
-export([main/0]).

peak(N) -> peak(N, N).

peak(1, Best) -> Best;
peak(N, Best) ->
    Next = case N rem 2 of 0 -> N div 2; 1 -> 3 * N + 1 end,
    peak(Next, max(Best, Next)).

main() -> io:format("~p~n", [peak(27)]).
