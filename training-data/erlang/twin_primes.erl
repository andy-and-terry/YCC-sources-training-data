-module(twin_primes).
-export([main/0]).

is_prime(N) when N < 2 -> false;
is_prime(N) -> not lists:any(fun(D) -> N rem D =:= 0 end, lists:seq(2, trunc(math:sqrt(N)))).

main() ->
    Ps = [P || P <- lists:seq(2, 50), is_prime(P)],
    io:format("~p~n", [[{P, Q} || {P, Q} <- lists:zip(lists:droplast(Ps), tl(Ps)), Q - P =:= 2]]).
