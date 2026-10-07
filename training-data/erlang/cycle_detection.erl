-module(cycle_detection).
-export([has_cycle/1, run/0]).

%% Detects a cycle in a directed graph (given as a map of node to its list
%% of neighbors) via DFS with three-color marking: `visiting` nodes are on
%% the current recursion stack, so reaching one again means a back edge,
%% i.e. a cycle.

has_cycle(Graph) ->
    check_nodes(maps:keys(Graph), Graph, #{}).

check_nodes([], _Graph, _State) ->
    false;
check_nodes([Node | Rest], Graph, State) ->
    case maps:get(Node, State, unvisited) of
        visited ->
            check_nodes(Rest, Graph, State);
        _ ->
            case visit(Node, Graph, State) of
                {cycle, _NewState} -> true;
                {ok, NewState} -> check_nodes(Rest, Graph, NewState)
            end
    end.

visit(Node, Graph, State) ->
    Neighbors = maps:get(Node, Graph, []),
    State1 = maps:put(Node, visiting, State),
    case visit_neighbors(Neighbors, Graph, State1) of
        {cycle, NewState} -> {cycle, NewState};
        {ok, NewState} -> {ok, maps:put(Node, visited, NewState)}
    end.

visit_neighbors([], _Graph, State) ->
    {ok, State};
visit_neighbors([N | Rest], Graph, State) ->
    case maps:get(N, State, unvisited) of
        visiting ->
            {cycle, State};
        visited ->
            visit_neighbors(Rest, Graph, State);
        unvisited ->
            case visit(N, Graph, State) of
                {cycle, NewState} -> {cycle, NewState};
                {ok, NewState} -> visit_neighbors(Rest, Graph, NewState)
            end
    end.

run() ->
    Acyclic = #{a => [b, c], b => [d], c => [d], d => []},
    Cyclic = #{a => [b], b => [c], c => [a]},
    io:format("~p~n", [has_cycle(Acyclic)]),
    io:format("~p~n", [has_cycle(Cyclic)]).
