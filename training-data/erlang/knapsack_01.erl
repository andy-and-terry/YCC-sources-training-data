-module(knapsack_01).
-export([solve/2]).

solve(Items, Capacity) ->
    Table = lists:foldl(
        fun({Weight, Value}, Acc) ->
            lists:foldl(
                fun(Cap, Acc2) ->
                    case Weight =< Cap of
                        true ->
                            Without = maps:get(Cap, Acc2, 0),
                            WithItem = maps:get(Cap - Weight, Acc2, 0) + Value,
                            maps:put(Cap, max(Without, WithItem), Acc2);
                        false ->
                            Acc2
                    end
                end,
                Acc,
                lists:seq(Capacity, 0, -1)
            )
        end,
        #{0 => 0},
        Items
    ),
    maps:get(Capacity, Table, 0).
