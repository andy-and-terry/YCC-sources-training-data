-module(lattice_paths).
-export([main/0]).
%% Lattice paths via repeated prefix sums.
step(Row) -> lists:reverse(element(2, lists:foldl(fun(X, {S, Acc}) -> {S + X, [S + X | Acc]} end, {0, []}, Row))).
lattice(N) -> lists:last(lists:foldl(fun(_, Row) -> step(Row) end, lists:duplicate(N + 1, 1), lists:seq(1, N))).
main() -> io:format("~p~n", [lattice(3)]).
