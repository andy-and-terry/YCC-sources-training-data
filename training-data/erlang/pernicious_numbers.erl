-module(pernicious_numbers).
-export([main/0]).

%% Pernicious numbers: the popcount is prime.
is_prime(N) when N < 2 -> false;
is_prime(N) -> not lists:any(fun(D) -> D * D =< N andalso N rem D =:= 0 end, lists:seq(2, N)).

popcount(0) -> 0;
popcount(N) -> (N band 1) + popcount(N bsr 1).

main() ->
    Out = [N || N <- lists:seq(1, 20), is_prime(popcount(N))],
    io:format("~s~n", [string:join([integer_to_list(N) || N <- Out], " ")]).
