-module(subset_sum).
-export([has_subset_sum/2]).

has_subset_sum([], Target) -> Target =:= 0;
has_subset_sum(_List, Target) when Target < 0 -> false;
has_subset_sum([X | Rest], Target) ->
    has_subset_sum(Rest, Target - X) orelse has_subset_sum(Rest, Target).

main() ->
    io:format("~p~n", [has_subset_sum([3, 34, 4, 12, 5, 2], 9)]).
