-module(tribonacci_numbers).
-export([main/0, tribonacci/1]).

%% Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
tribonacci(Count) -> tribonacci(Count, 0, 0, 1).

tribonacci(0, _, _, _) -> [];
tribonacci(N, A, B, C) -> [A | tribonacci(N - 1, B, C, A + B + C)].

main() ->
    io:format("Tribonacci: ~p~n", [tribonacci(15)]).
