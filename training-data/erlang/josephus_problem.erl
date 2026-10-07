-module(josephus_problem).
-export([winner/2]).

%% The classic recursive Josephus recurrence: with N people in a circle
%% eliminating every Kth one, the zero-indexed survivor position among
%% N people is derived from the survivor position among N - 1 people.

survivor(1, _K) -> 0;
survivor(N, K) -> (survivor(N - 1, K) + K) rem N.

winner(N, K) -> survivor(N, K) + 1.

run() ->
    io:format("~p~n", [winner(7, 3)]),
    io:format("~p~n", [winner(41, 3)]).
