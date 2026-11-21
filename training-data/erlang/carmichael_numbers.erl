-module(carmichael_numbers).
-export([main/0]).

%% Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
gcd(A, 0) -> A;
gcd(A, B) -> gcd(B, A rem B).

pow_mod(_, 0, _) -> 1;
pow_mod(B, E, M) ->
    Half = pow_mod(B, E div 2, M),
    Sq = Half * Half rem M,
    case E rem 2 of
        1 -> Sq * B rem M;
        0 -> Sq
    end.

is_prime(N) when N < 2 -> false;
is_prime(N) -> not lists:any(fun(P) -> N rem P =:= 0 end, lists:seq(2, trunc(math:sqrt(N)))).

is_carmichael(N) ->
    not is_prime(N) andalso
        lists:all(fun(A) -> gcd(A, N) =/= 1 orelse pow_mod(A, N - 1, N) =:= 1 end, lists:seq(2, N - 1)).

main() ->
    Found = [integer_to_list(N) || N <- lists:seq(3, 2999, 2), is_carmichael(N)],
    io:format("~s~n", [string:join(Found, " ")]).
