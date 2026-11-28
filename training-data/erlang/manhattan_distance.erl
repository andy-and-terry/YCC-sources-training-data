-module(manhattan_distance).
-export([main/0]).

manhattan(A, B) -> lists:sum(lists:zipwith(fun(X, Y) -> abs(X - Y) end, A, B)).

main() -> io:format("~p~n", [manhattan([1, 2], [4, 6])]).
