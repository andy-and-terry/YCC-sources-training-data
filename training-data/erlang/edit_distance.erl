-module(edit_distance).
-export([distance/2]).

distance(A, B) ->
    M = length(A),
    N = length(B),
    At = list_to_tuple(A),
    Bt = list_to_tuple(B),
    FirstRow = maps:from_list([{{0, J}, J} || J <- lists:seq(0, N)]),
    Table = lists:foldl(
        fun(I, Acc) ->
            Acc1 = maps:put({I, 0}, I, Acc),
            lists:foldl(
                fun(J, Acc2) ->
                    Cost = case element(I, At) =:= element(J, Bt) of
                        true -> 0;
                        false -> 1
                    end,
                    Val = lists:min([
                        maps:get({I - 1, J}, Acc2) + 1,
                        maps:get({I, J - 1}, Acc2) + 1,
                        maps:get({I - 1, J - 1}, Acc2) + Cost
                    ]),
                    maps:put({I, J}, Val, Acc2)
                end,
                Acc1,
                lists:seq(1, N)
            )
        end,
        FirstRow,
        lists:seq(1, M)
    ),
    maps:get({M, N}, Table).
