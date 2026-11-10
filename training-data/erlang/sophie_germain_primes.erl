-module(sophie_germain_primes).
-export([main/0]).

is_prime(N) when N < 2 -> false;
is_prime(N) -> not lists:any(fun(D) -> N rem D =:= 0 end, lists:seq(2, trunc(math:sqrt(N)))).

collect(_, 0, Acc) -> lists:reverse(Acc);
collect(P, Left, Acc) ->
    case is_prime(P) andalso is_prime(2 * P + 1) of
        true -> collect(P + 1, Left - 1, [P | Acc]);
        false -> collect(P + 1, Left, Acc)
    end.

main() -> io:format("~p~n", [collect(2, 10, [])]). % [2,3,5,11,23,29,41,53,83,89]
