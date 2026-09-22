-module(binary_comprehension_demo).
-export([run/0]).

run() ->
    Doubled = << <<(X * 2)>> || <<X>> <= <<1, 2, 3, 4, 5>> >>,
    io:format("~p~n", [Doubled]),
    Evens = << <<X>> || <<X>> <= <<1, 2, 3, 4, 5, 6>>, X rem 2 =:= 0 >>,
    io:format("~p~n", [Evens]),
    FromList = << <<N:16>> || N <- [100, 200, 300] >>,
    io:format("~p~n", [FromList]).
