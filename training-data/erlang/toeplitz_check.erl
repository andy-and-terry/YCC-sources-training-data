-module(toeplitz_check).
-export([main/0, is_toeplitz/1]).

is_toeplitz([_]) -> true;
is_toeplitz([]) -> true;
is_toeplitz([Prev, Cur | Rest]) ->
    tl(Cur) =:= lists:sublist(Prev, length(Cur) - 1) andalso is_toeplitz([Cur | Rest]).

main() ->
    io:format("~p~n", [is_toeplitz([[1, 2, 3], [4, 1, 2], [5, 4, 1]])]),
    io:format("~p~n", [is_toeplitz([[1, 2], [2, 2]])]).
