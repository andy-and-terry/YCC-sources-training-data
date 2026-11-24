-module(aliquot_sequence).
-export([main/0]).

%% Aliquot sequence: replace n by the sum of its proper divisors.
aliquot_sum(N) -> lists:sum([D || D <- lists:seq(1, N div 2), N rem D =:= 0]).

aliquot(N, Count) when N =< 1; Count >= 20 -> [N];
aliquot(N, Count) -> [N | aliquot(aliquot_sum(N), Count + 1)].

main() ->
    io:format("~s~n", [string:join([integer_to_list(X) || X <- aliquot(12, 0)], " ")]).
