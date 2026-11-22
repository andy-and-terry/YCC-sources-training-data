-module(twin_primes).
-export([main/0]).

%% Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
is_prime(N) when N < 2 -> false;
is_prime(N) -> not lists:any(fun(D) -> N rem D =:= 0 end, lists:seq(2, trunc(math:sqrt(N)))).

main() ->
    L = [P || P <- lists:seq(2, 99), is_prime(P), is_prime(P + 2)],
    io:format("~s~n", [string:join([integer_to_list(X) || X <- L], " ")]).
