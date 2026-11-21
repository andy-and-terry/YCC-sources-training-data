-module(amicable_pairs).
-export([main/0]).

%% Amicable pairs below 1500 via sums of proper divisors.
s(N) -> lists:sum([D || D <- lists:seq(1, N - 1), N rem D =:= 0]).

main() ->
    [io:format("~p ~p~n", [A, B]) || A <- lists:seq(2, 1499), B <- [s(A)], B > A, s(B) =:= A],
    ok.
