%% Amicable pairs: d(A) =:= B and d(B) =:= A with A =/= B.
-module(amicable_pairs).
-export([main/0]).

d(N) -> lists:sum([I || I <- lists:seq(1, N - 1), N rem I =:= 0]).

main() ->
    Pairs = [{A, B} || A <- lists:seq(2, 1499), B <- [d(A)], B > A, d(B) =:= A],
    io:format("~p~n", [Pairs]).
