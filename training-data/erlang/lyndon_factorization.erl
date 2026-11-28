-module(lyndon_factorization).
-export([main/0]).

is_lyndon(W) ->
    N = length(W),
    lists:all(fun(I) -> W < lists:nthtail(I, W) end, lists:seq(1, N - 1)).

factor([]) -> [];
factor(S) ->
    Lens = [L || L <- lists:seq(1, length(S)), is_lyndon(lists:sublist(S, L))],
    Len = lists:max(Lens),
    [lists:sublist(S, Len) | factor(lists:nthtail(Len, S))].

main() -> io:format("~p~n", [factor("banana")]).
