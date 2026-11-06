%% Fermat primality test; Carmichael number 561 fools it.
-module(fermat_primality).
-export([main/0]).

powmod(_B, 0, M) -> 1 rem M;
powmod(B, E, M) ->
    Half = powmod(B, E div 2, M),
    Sq = Half * Half rem M,
    case E rem 2 of
        0 -> Sq;
        1 -> Sq * B rem M
    end.

probably_prime(N) -> N > 2 andalso powmod(2, N - 1, N) =:= 1.

main() ->
    lists:foreach(fun(N) -> io:format("~p ~p~n", [N, probably_prime(N)]) end, [97, 91, 561]).
