-module(polite_numbers).
-export([main/0]).

%% Ways to write N as a sum of two or more consecutive positive integers.
polite_ways(N) ->
    length([K || K <- lists:seq(2, N + 1),
                 K * (K + 1) div 2 =< N,
                 (N - K * (K - 1) div 2) rem K =:= 0]).

main() ->
    Out = [polite_ways(N) || N <- lists:seq(1, 16)],
    io:format("~s~n", [string:join([integer_to_list(W) || W <- Out], " ")]).
