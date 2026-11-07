-module(insert_interval).
-export([run/0, insert/2]).

insert(Ivs, {NLo, NHi}) ->
    {Before, Rest} = lists:splitwith(fun({_, H}) -> H < NLo end, Ivs),
    {Overlap, After} = lists:splitwith(fun({L, _}) -> L =< NHi end, Rest),
    Lo = lists:min([NLo | [L || {L, _} <- Overlap]]),
    Hi = lists:max([NHi | [H || {_, H} <- Overlap]]),
    Before ++ [{Lo, Hi}] ++ After.

run() ->
    io:format("~p~n", [insert([{1, 3}, {6, 9}], {2, 5})]).
