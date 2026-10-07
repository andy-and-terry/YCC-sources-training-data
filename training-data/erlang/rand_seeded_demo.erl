-module(rand_seeded_demo).
-export([run/0]).

run() ->
    S0 = rand:seed_s(exsplus, {1, 2, 3}),
    {A, S1} = rand:uniform_s(100, S0),
    {B, _S2} = rand:uniform_s(100, S1),
    S0b = rand:seed_s(exsplus, {1, 2, 3}),
    {A2, _} = rand:uniform_s(100, S0b),
    io:format("~p ~p~n", [A =:= A2, B >= 1]),
    L = lists:seq(1, 10),
    Shuffled = [X || {_, X} <- lists:sort([{rand:uniform(), X} || X <- L])],
    io:format("~p~n", [lists:sort(Shuffled) =:= L]).
