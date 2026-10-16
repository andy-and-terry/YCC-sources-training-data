-module(accumulator_reverse).
-export([run/0, reverse/1, reverse/2]).

reverse(L) -> reverse(L, []).

reverse([], Acc) -> Acc;
reverse([H | T], Acc) -> reverse(T, [H | Acc]).

run() ->
    io:format("~p~n", [reverse([1, 2, 3, 4, 5])]),
    io:format("~p~n", [reverse([])]),
    io:format("~p~n", [reverse("stressed")]).
