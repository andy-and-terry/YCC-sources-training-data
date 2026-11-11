%% Narayana's cows N(n)=N(n-1)+N(n-3)
-module(NarayanaCows).
-export([main/0]).

extend(Acc) ->
    N = length(Acc),
    Acc ++ [lists:nth(N - 1 + 1, Acc) + lists:nth(N - 3 + 1, Acc)].

main() ->
    Seq = lists:foldl(fun(_, Acc) -> extend(Acc) end, [1, 1, 1], lists:seq(1, 7)),
    io:format("~p~n", [Seq]).
