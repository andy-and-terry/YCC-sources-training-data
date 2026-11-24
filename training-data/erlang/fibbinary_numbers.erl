-module(fibbinary_numbers).
-export([main/0]).

%% Fibbinary numbers: no two adjacent 1 bits.
main() ->
    L = [N || N <- lists:seq(0, 49), N band (N bsr 1) =:= 0],
    io:format("~s~n", [string:join([integer_to_list(N) || N <- L], " ")]).
