-module(matrix_chain_multiplication).
-export([min_cost/1]).

min_cost(Dims) ->
    N = length(Dims) - 1,
    DimsArray = list_to_tuple(Dims),
    Table = lists:foldl(
        fun(Len, Acc) -> fill_length(Len, N, DimsArray, Acc) end,
        #{},
        lists:seq(2, N)
    ),
    maps:get({1, N}, Table).

fill_length(Len, N, Dims, Table) ->
    lists:foldl(
        fun(I, Acc) ->
            J = I + Len - 1,
            Best = lists:min([
                maps:get({I, K}, Acc, 0) + maps:get({K + 1, J}, Acc, 0)
                    + element(I, Dims) * element(K + 1, Dims) * element(J + 1, Dims)
                || K <- lists:seq(I, J - 1)
            ]),
            maps:put({I, J}, Best, Acc)
        end,
        Table,
        lists:seq(1, N - Len + 1)
    ).

main() ->
    io:format("~p~n", [min_cost([30, 35, 15, 5, 10, 20])]).
