%% Square of the sum minus sum of squares for 1..10 (expect 2640)
-module(SumSquareDifference).
-export([main/0]).

main() ->
    Xs = lists:seq(1, 10),
    Sum = lists:sum(Xs),
    Squares = lists:sum([X * X || X <- Xs]),
    io:format("~p~n", [Sum * Sum - Squares]).
