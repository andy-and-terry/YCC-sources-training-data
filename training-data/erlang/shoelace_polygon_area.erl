-module(shoelace_polygon_area).
-export([main/0]).
%% Shoelace polygon area.
area(Pts) ->
    Next = tl(Pts) ++ [hd(Pts)],
    abs(lists:sum([X1 * Y2 - X2 * Y1 || {{X1, Y1}, {X2, Y2}} <- lists:zip(Pts, Next)])) / 2.
main() -> io:format("~p~n", [area([{0, 0}, {4, 0}, {4, 3}, {0, 3}])]).
