-module(stern_diatomic).
-export([main/0]).

stern(Count) ->
    Seq = lists:foldl(
        fun(I, Acc) ->
            H = I div 2,
            V = case I rem 2 of
                    0 -> maps:get(H, Acc);
                    1 -> maps:get(H, Acc) + maps:get(H + 1, Acc)
                end,
            maps:put(I, V, Acc)
        end,
        #{0 => 0, 1 => 1},
        lists:seq(2, Count - 1)),
    [maps:get(I, Seq) || I <- lists:seq(0, Count - 1)].

main() -> io:format("~p~n", [stern(15)]).   %% [0,1,1,2,1,3,2,3,1,4,3,5,2,5,3]
