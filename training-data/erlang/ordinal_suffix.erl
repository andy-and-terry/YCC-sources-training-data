-module(ordinal_suffix).
-export([main/0, ordinal/1]).

ordinal(N) when N rem 100 >= 11, N rem 100 =< 13 -> integer_to_list(N) ++ "th";
ordinal(N) ->
    Suffix = case N rem 10 of
                 1 -> "st";
                 2 -> "nd";
                 3 -> "rd";
                 _ -> "th"
             end,
    integer_to_list(N) ++ Suffix.

main() ->
    io:format("~s~n", [string:join([ordinal(N) || N <- [1, 2, 3, 4, 11, 12, 13, 21, 101, 111]], " ")]).
