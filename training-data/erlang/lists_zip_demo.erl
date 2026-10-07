-module(lists_zip_demo).
-export([run/0]).

run() ->
    Names = [alice, bob, carol],
    Ages = [30, 25, 41],
    Pairs = lists:zip(Names, Ages),
    io:format("~p~n", [Pairs]),
    {Ns, As} = lists:unzip(Pairs),
    io:format("~p ~p~n", [Ns, As]),
    io:format("~p~n", [lists:zipwith(fun(N, A) -> {N, A + 1} end, Names, Ages)]),
    io:format("~p~n", [lists:keyfind(bob, 1, Pairs)]),
    io:format("~p~n", [lists:keysort(2, Pairs)]).
