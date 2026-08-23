-module(topological_sort).
-export([sort/1]).

sort(Graph) ->
    Nodes = maps:keys(Graph),
    {_Visited, Order} = lists:foldl(
        fun(Node, Acc) -> visit(Graph, Node, Acc) end,
        {sets:new(), []},
        Nodes
    ),
    Order.

visit(Graph, Node, {Visited, Order}) ->
    case sets:is_element(Node, Visited) of
        true -> {Visited, Order};
        false ->
            Visited1 = sets:add_element(Node, Visited),
            Deps = maps:get(Node, Graph, []),
            {Visited2, Order2} = lists:foldl(
                fun(D, Acc) -> visit(Graph, D, Acc) end,
                {Visited1, Order},
                Deps
            ),
            {Visited2, [Node | Order2]}
    end.
