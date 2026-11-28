-module(patience_lis).
-export([main/0]).

insert(X, []) -> [X];
insert(X, [T | Rest]) when T >= X -> [X | Rest];
insert(X, [T | Rest]) -> [T | insert(X, Rest)].

main() ->
    Tails = lists:foldl(fun insert/2, [], [10, 9, 2, 5, 3, 7, 101, 18]),
    io:format("~p~n", [length(Tails)]).
