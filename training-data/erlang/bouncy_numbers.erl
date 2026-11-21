-module(bouncy_numbers).
-export([main/0]).

%% Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
is_bouncy(N) ->
    D = integer_to_list(N),
    S = lists:sort(D),
    D =/= S andalso D =/= lists:reverse(S).

main() ->
    io:format("~p~n", [length([N || N <- lists:seq(1, 999), is_bouncy(N)])]).
