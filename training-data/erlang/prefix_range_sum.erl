-module(prefix_range_sum).
-export([main/0, build/1, query/3]).

build(Values) ->
    list_to_tuple(lists:reverse(lists:foldl(fun(V, [H | _] = Acc) -> [H + V | Acc] end, [0], Values))).

query(Prefix, Lo, Hi) -> element(Hi + 1, Prefix) - element(Lo + 1, Prefix).

main() ->
    P = build([3, 1, 4, 1, 5, 9, 2, 6]),
    io:format("~p~n", [query(P, 2, 5)]).
