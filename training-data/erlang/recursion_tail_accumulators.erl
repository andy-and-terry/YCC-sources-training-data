-module(recursion_tail_accumulators).
-export([main/0]).

sum([], Acc) -> Acc;
sum([H | T], Acc) -> sum(T, Acc + H).

fact(0) -> 1;
fact(N) when N > 0 -> N * fact(N - 1).

reverse(L) -> reverse(L, []).
reverse([], Acc) -> Acc;
reverse([H | T], Acc) -> reverse(T, [H | Acc]).

len([]) -> 0;
len([_ | T]) -> 1 + len(T).

main() ->
    io:format("~p ~p ~p ~p~n", [sum([1, 2, 3, 4], 0), fact(15), reverse([1, 2, 3]), len("hello")]).
