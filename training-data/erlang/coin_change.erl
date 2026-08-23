-module(coin_change).
-export([min_coins/2]).

min_coins(Coins, Amount) ->
    Table = lists:foldl(
        fun(N, Acc) ->
            Options = [maps:get(N - C, Acc, infinity) || C <- Coins, C =< N],
            Filtered = [O || O <- Options, O =/= infinity],
            Best = case Filtered of
                [] -> infinity;
                _ -> lists:min(Filtered) + 1
            end,
            maps:put(N, Best, Acc)
        end,
        #{0 => 0},
        lists:seq(1, Amount)
    ),
    maps:get(Amount, Table).
