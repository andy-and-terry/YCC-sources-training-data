-module(depth_first_search).
-export([dfs/2]).

dfs(Graph, Start) ->
    {_Visited, Order} = visit(Graph, Start, [Start], []),
    lists:reverse(Order).

visit(Graph, Node, Visited, Order) ->
    Neighbors = maps:get(Node, Graph, []),
    lists:foldl(
        fun(Neighbor, {VAcc, OAcc}) ->
            case lists:member(Neighbor, VAcc) of
                true -> {VAcc, OAcc};
                false -> visit(Graph, Neighbor, [Neighbor | VAcc], OAcc)
            end
        end,
        {Visited, [Node | Order]},
        Neighbors
    ).

main() ->
    Graph = #{a => [b, c], b => [], c => [d], d => []},
    io:format("~p~n", [dfs(Graph, a)]).
