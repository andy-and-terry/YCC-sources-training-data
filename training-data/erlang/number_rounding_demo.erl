-module(number_rounding_demo).
-export([main/0]).

main() ->
    io:format("~p ~p~n", [round(2.5), round(-2.5)]),
    io:format("~p ~p~n", [trunc(2.9), trunc(-2.9)]),
    io:format("~p ~p~n", [ceil(2.1), floor(-2.1)]),
    io:format("~p ~p~n", [abs(-7), abs(3.5)]),
    io:format("~p ~p~n", [7 div 2, -7 div 2]),
    io:format("~p ~p~n", [7 rem 3, -7 rem 3]),
    io:format("~.2f~n", [3.14159]).
