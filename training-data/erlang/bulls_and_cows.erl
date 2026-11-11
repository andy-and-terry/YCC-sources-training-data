%% Bulls and Cows scoring for equal-length digit strings.
-module(bulls_and_cows).
-export([main/0]).

score(Secret, Guess) ->
    Pairs = lists:zip(Secret, Guess),
    Bulls = length([ok || {S, G} <- Pairs, S =:= G]),
    Rest = [{S, G} || {S, G} <- Pairs, S =/= G],
    {Cows, _} = lists:foldl(
        fun({_, G}, {Count, Pool}) ->
            case lists:member(G, Pool) of
                true -> {Count + 1, Pool -- [G]};
                false -> {Count, Pool}
            end
        end,
        {0, [S || {S, _} <- Rest]},
        Rest),
    {Bulls, Cows}.

main() ->
    {B, C} = score("1807", "7810"),
    io:format("~p bull(s), ~p cow(s)~n", [B, C]).
