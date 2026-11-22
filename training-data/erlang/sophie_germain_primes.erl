-module(sophie_germain_primes).
-export([main/0]).

%% Sophie Germain primes: p prime and 2p + 1 prime.
is_prime(N) when N < 2 -> false;
is_prime(N) -> not lists:any(fun(D) -> N rem D =:= 0 end, lists:seq(2, trunc(math:sqrt(N)))).

main() ->
    L = [P || P <- lists:seq(2, 99), is_prime(P), is_prime(2 * P + 1)],
    io:format("~s~n", [string:join([integer_to_list(X) || X <- L], " ")]).
