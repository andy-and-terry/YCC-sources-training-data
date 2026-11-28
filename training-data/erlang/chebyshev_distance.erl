-module(chebyshev_distance).
-export([main/0]).

chebyshev(A, B) -> lists:max(lists:zipwith(fun(X, Y) -> abs(X - Y) end, A, B)).

main() -> io:format("~p~n", [chebyshev([1, 2], [4, 6])]).
