-module(rail_fence_cipher).
-export([main/0, encode/2]).

encode(Text, Rails) ->
    Period = 2 * (Rails - 1),
    Keyed = [{rail(I, Rails, Period), I, C} || {I, C} <- lists:zip(lists:seq(0, length(Text) - 1), Text)],
    [C || {_, _, C} <- lists:sort(Keyed)].

rail(I, Rails, Period) ->
    M = I rem Period,
    if M < Rails -> M; true -> Period - M end.

main() ->
    io:format("~s~n", [encode("WEAREDISCOVERED", 3)]).
