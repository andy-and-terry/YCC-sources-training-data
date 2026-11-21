-module(munchausen_numbers).
-export([main/0]).

%% Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
pow(_, 0) -> 1;
pow(D, E) -> D * pow(D, E - 1).

is_munchausen(N) ->
    lists:sum([case D of 0 -> 0; _ -> pow(D, D) end || C <- integer_to_list(N), D <- [C - $0]]) =:= N.

main() ->
    Found = [integer_to_list(N) || N <- lists:seq(1, 4999), is_munchausen(N)],
    io:format("~s~n", [string:join(Found, " ")]).
