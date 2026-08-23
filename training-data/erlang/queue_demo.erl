-module(queue_demo).
-export([run/0]).

run() ->
    Q0 = queue:new(),
    Q1 = queue:in(1, Q0),
    Q2 = queue:in(2, Q1),
    Q3 = queue:in(3, Q2),
    {{value, Front}, Q4} = queue:out(Q3),
    io:format("~p~n", [Front]),
    io:format("~p~n", [queue:to_list(Q4)]).
