-module(zigzag_convert).
-export([main/0, zigzag/2]).

zigzag(S, Rows) when Rows =:= 1; Rows >= length(S) -> S;
zigzag(S, Rows) ->
    Cycle = lists:seq(1, Rows) ++ lists:reverse(lists:seq(2, Rows - 1)),
    Indexed = lists:zip(lists:sublist(lists:append(lists:duplicate(length(S), Cycle)), length(S)), S),
    lists:flatten([[C || {R, C} <- Indexed, R =:= Row] || Row <- lists:seq(1, Rows)]).

main() ->
    io:format("~s~n", [zigzag("PAYPALISHIRING", 3)]).
