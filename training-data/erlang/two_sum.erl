-module(two_sum).
-export([find/2]).

find(List, Target) ->
    Indexed = lists:zip(List, lists:seq(0, length(List) - 1)),
    find(Indexed, Target, #{}).

find([], _Target, _Seen) -> not_found;
find([{N, I} | Rest], Target, Seen) ->
    Complement = Target - N,
    case maps:find(Complement, Seen) of
        {ok, J} -> {J, I};
        error -> find(Rest, Target, maps:put(N, I, Seen))
    end.
