-module(shoelace_area).
-export([main/0]).

area(Pts) ->
    Next = tl(Pts) ++ [hd(Pts)],
    S = lists:sum([X1 * Y2 - X2 * Y1 || {{X1, Y1}, {X2, Y2}} <- lists:zip(Pts, Next)]),
    abs(S) / 2.

main() -> io:format("~p~n", [area([{0, 0}, {4, 0}, {4, 3}, {0, 3}])]).
