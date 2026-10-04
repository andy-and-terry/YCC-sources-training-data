-module(math_functions_demo).
-export([run/0]).

run() ->
    io:format("~p~n", [math:sqrt(144)]),
    io:format("~p~n", [math:pow(2, 10)]),
    io:format("~.4f~n", [math:pi()]),
    io:format("~.4f~n", [math:exp(1)]),
    io:format("~.4f~n", [math:log(100) / math:log(10)]),
    io:format("~p~n", [math:log2(1024)]),
    io:format("~.3f~n", [math:sin(math:pi() / 6)]),
    io:format("~p~n", [abs(-7)]),
    io:format("~p~n", [round(2.5)]),
    io:format("~p~n", [trunc(-2.9)]),
    io:format("~p~n", [ceil(2.1)]),
    io:format("~p~n", [floor(-2.1)]),
    io:format("~p~n", [17 div 5]),
    io:format("~p~n", [-17 rem 5]),
    io:format("~p~n", [max(3, 8)]).
