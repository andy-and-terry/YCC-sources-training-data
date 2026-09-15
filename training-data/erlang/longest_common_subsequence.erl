-module(longest_common_subsequence).
-export([length_of/2]).

length_of(A, B) ->
    M = length(A),
    N = length(B),
    At = list_to_tuple(A),
    Bt = list_to_tuple(B),
    FirstRow = maps:from_list([{{0, J}, 0} || J <- lists:seq(0, N)]),
    Table = lists:foldl(
        fun(I, Acc) ->
            Acc1 = maps:put({I, 0}, 0, Acc),
            lists:foldl(
                fun(J, Acc2) ->
                    Val = case element(I, At) =:= element(J, Bt) of
                        true -> maps:get({I - 1, J - 1}, Acc2) + 1;
                        false -> max(maps:get({I - 1, J}, Acc2), maps:get({I, J - 1}, Acc2))
                    end,
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
