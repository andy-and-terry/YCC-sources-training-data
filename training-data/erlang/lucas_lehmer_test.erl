-module(lucas_lehmer_test).
-export([main/0]).

loop(0, S, _M) -> S;
loop(K, S, M) -> loop(K - 1, (S * S - 2) rem M, M).

is_mersenne_exponent(2) -> true;
is_mersenne_exponent(P) ->
    M = (1 bsl P) - 1,
    loop(P - 2, 4, M) =:= 0.

main() ->
    Ps = [integer_to_list(P) || P <- [2, 3, 5, 7, 11, 13, 17, 19], is_mersenne_exponent(P)],
    io:format("~s~n", [lists:flatten(lists:join(" ", Ps))]).
