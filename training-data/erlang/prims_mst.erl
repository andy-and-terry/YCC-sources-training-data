-module(prims_mst).
-export([mst_weight/2]).

mst_weight(NumNodes, Graph) ->
    Key0 = maps:from_list([{N, infinity} || N <- lists:seq(0, NumNodes - 1)]),
    Key1 = maps:put(0, 0, Key0),
    prim(Graph, NumNodes, Key1, sets:new(), 0).

prim(_Graph, NumNodes, _Key, InMst, Total) when sets:size(InMst) =:= NumNodes ->
    Total;
prim(Graph, NumNodes, Key, InMst, Total) ->
    {Weight, U} = pick_min(Key, InMst),
    InMst1 = sets:add_element(U, InMst),
    Neighbors = maps:get(U, Graph, []),
    Key1 = lists:foldl(
        fun({V, W}, AccKey) ->
            case sets:is_element(V, InMst1) of
                true -> AccKey;
                false ->
                    case W < maps:get(V, AccKey) of
                        true -> maps:put(V, W, AccKey);
                        false -> AccKey
                    end
            end
        end,
        Key,
        Neighbors
    ),
    prim(Graph, NumNodes, Key1, InMst1, Total + Weight).

pick_min(Key, InMst) ->
    Candidates = [{W, N} || {N, W} <- maps:to_list(Key), not sets:is_element(N, InMst)],
    lists:min(Candidates).

main() ->
    Graph = #{
        0 => [{1, 2}, {2, 3}],
        1 => [{0, 2}, {2, 1}, {3, 4}],
        2 => [{0, 3}, {1, 1}, {3, 5}, {4, 6}],
        3 => [{1, 4}, {2, 5}, {4, 7}],
        4 => [{2, 6}, {3, 7}]
    },
    io:format("~p~n", [mst_weight(5, Graph)]).
