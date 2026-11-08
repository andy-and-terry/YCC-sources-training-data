-module(rail_fence_cipher).
-export([main/0]).

rail(I, Rails) ->
    P = 2 * (Rails - 1),
    M = I rem P,
    if M < Rails -> M; true -> P - M end.

encode(S, Rails) ->
    Tagged = [{rail(I, Rails), I, C} || {I, C} <- lists:zip(lists:seq(0, length(S) - 1), S)],
    [C || {_, _, C} <- lists:sort(Tagged)].

main() -> io:format("~s~n", [encode("WEAREDISCOVERED", 3)]).
