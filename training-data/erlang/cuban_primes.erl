-module(cuban_primes).
-export([main/0]).

is_prime(N) when N < 2 -> false;
is_prime(N) -> is_prime(N, 2).
is_prime(N, I) when I * I > N -> true;
is_prime(N, I) when N rem I =:= 0 -> false;
is_prime(N, I) -> is_prime(N, I + 1).

cuban(_Y, 0, Acc) -> lists:reverse(Acc);
cuban(Y, Left, Acc) ->
    P = 3 * Y * Y + 3 * Y + 1,
    case is_prime(P) of
        true -> cuban(Y + 1, Left - 1, [P | Acc]);
        false -> cuban(Y + 1, Left, Acc)
    end.

main() ->
    io:format("~p~n", [cuban(1, 8, [])]).
