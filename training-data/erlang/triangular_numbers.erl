-module(triangular_numbers).
-export([main/0, triangular/1]).

triangular(Count) ->
    {List, _} = lists:mapfoldl(fun(N, Sum) -> {Sum + N, Sum + N} end, 0, lists:seq(1, Count)),
    List.

main() -> io:format("~p~n", [triangular(10)]).
