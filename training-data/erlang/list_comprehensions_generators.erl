-module(list_comprehensions_generators).
-export([main/0]).

main() ->
    io:format("~p~n", [[X * X || X <- lists:seq(1, 10), X rem 2 =:= 0]]),
    io:format("~p~n", [[{X, Y} || X <- [1, 2, 3], Y <- [a, b], X =/= 2]]),
    io:format("~p~n", [[C || <<C>> <= <<"hello">>, C =/= $l]]),
    io:format("~p~n", [maps:from_list([{K, K * 2} || K <- [1, 2, 3]])]),
    io:format("~p~n", [[{X, Y, Z} || X <- lists:seq(1, 20), Y <- lists:seq(X, 20), Z <- lists:seq(Y, 20), X * X + Y * Y =:= Z * Z]]).
