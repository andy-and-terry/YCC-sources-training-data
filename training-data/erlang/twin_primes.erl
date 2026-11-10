-module(twin_primes).
-export([main/0]).

is_prime(N) when N < 2 -> false;
is_prime(N) -> not lists:any(fun(D) -> N rem D =:= 0 end, lists:seq(2, trunc(math:sqrt(N)))).

main() ->
    Pairs = [{P, P + 2} || P <- lists:seq(3, 78), is_prime(P), is_prime(P + 2)],
    io:format("~p~n", [Pairs]). % [{3,5},{5,7},{11,13},{17,19},{29,31},{41,43},{59,61},{71,73}]
