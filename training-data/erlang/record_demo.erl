-module(record_demo).
-export([add_points/2]).

-record(point, {x, y}).

add_points(#point{x = X1, y = Y1}, #point{x = X2, y = Y2}) ->
    #point{x = X1 + X2, y = Y1 + Y2}.

main() ->
    P1 = #point{x = 1, y = 2},
    P2 = #point{x = 3, y = 4},
    io:format("~p~n", [add_points(P1, P2)]).
