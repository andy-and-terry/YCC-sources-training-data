%% Perrin sequence P(n)=P(n-2)+P(n-3)
-module(PerrinSequence).
-export([main/0]).

extend(Acc) ->
    N = length(Acc),
    Acc ++ [lists:nth(N - 2 + 1, Acc) + lists:nth(N - 3 + 1, Acc)].

main() ->
    Seq = lists:foldl(fun(_, Acc) -> extend(Acc) end, [3, 0, 2], lists:seq(1, 7)),
    io:format("~p~n", [Seq]).
