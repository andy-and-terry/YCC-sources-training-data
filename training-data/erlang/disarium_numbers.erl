-module(disarium_numbers).
-export([main/0]).

%% Disarium numbers: digits raised to their 1-based positions sum to n.
pow(_, 0) -> 1;
pow(D, E) -> D * pow(D, E - 1).

is_disarium(N) ->
    Digits = [C - $0 || C <- integer_to_list(N)],
    lists:sum([pow(D, I) || {D, I} <- lists:zip(Digits, lists:seq(1, length(Digits)))]) =:= N.

main() ->
    Found = [integer_to_list(N) || N <- lists:seq(1, 999), is_disarium(N)],
    io:format("~s~n", [string:join(Found, " ")]).
