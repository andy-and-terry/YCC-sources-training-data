-module(bipartite_check).
-export([is_bipartite/1]).

is_bipartite(Graph) ->
    Nodes = maps:keys(Graph),
    check_all(Nodes, Graph, #{}).

check_all([], _Graph, _Colors) -> true;
check_all([Node | Rest], Graph, Colors) ->
    case maps:is_key(Node, Colors) of
        true -> check_all(Rest, Graph, Colors);
        false ->
            case color_component(Graph, [Node], maps:put(Node, 0, Colors)) of
                {ok, NewColors} -> check_all(Rest, Graph, NewColors);
                error -> false
            end
    end.

color_component(_Graph, [], Colors) -> {ok, Colors};
color_component(Graph, [Node | Rest], Colors) ->
    NodeColor = maps:get(Node, Colors),
    Neighbors = maps:get(Node, Graph, []),
    case color_neighbors(Neighbors, NodeColor, Colors) of
        {ok, NewColors, Queue} -> color_component(Graph, Rest ++ Queue, NewColors);
        error -> error
    end.

color_neighbors([], _NodeColor, Colors) -> {ok, Colors, []};
color_neighbors([N | Rest], NodeColor, Colors) ->
    OppositeColor = 1 - NodeColor,
    case maps:find(N, Colors) of
        {ok, C} when C =:= NodeColor -> error;
        {ok, _C} -> color_neighbors(Rest, NodeColor, Colors);
        error ->
            case color_neighbors(Rest, NodeColor, maps:put(N, OppositeColor, Colors)) of
                {ok, NewColors, Queue} -> {ok, NewColors, [N | Queue]};
                error -> error
            end
    end.

main() ->
    Graph = #{a => [b, c], b => [a, d], c => [a, d], d => [b, c]},
    io:format("~p~n", [is_bipartite(Graph)]).
