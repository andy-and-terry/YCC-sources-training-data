-module(tarjan_scc).
-export([find_sccs/2]).

find_sccs(Graph, Nodes) ->
    State0 = #{
        index => 0,
        indices => #{},
        lowlink => #{},
        onstack => sets:new(),
        stack => [],
        components => []
    },
    FinalState = lists:foldl(
        fun(Node, State) ->
            case maps:is_key(Node, maps:get(indices, State)) of
                true -> State;
                false -> strong_connect(Node, Graph, State)
            end
        end,
        State0,
        Nodes
    ),
    maps:get(components, FinalState).

strong_connect(V, Graph, State0) ->
    Idx = maps:get(index, State0),
    State1 = State0#{
        indices := maps:put(V, Idx, maps:get(indices, State0)),
        lowlink := maps:put(V, Idx, maps:get(lowlink, State0)),
        index := Idx + 1,
        stack := [V | maps:get(stack, State0)],
        onstack := sets:add_element(V, maps:get(onstack, State0))
    },
    Neighbors = maps:get(V, Graph, []),
    State2 = lists:foldl(fun(W, State) -> visit_neighbor(V, W, Graph, State) end, State1, Neighbors),
    LowV = maps:get(V, maps:get(lowlink, State2)),
    IdxV = maps:get(V, maps:get(indices, State2)),
    case LowV =:= IdxV of
        true -> pop_component(V, State2);
        false -> State2
    end.

visit_neighbor(V, W, Graph, State) ->
    Indices = maps:get(indices, State),
    case maps:is_key(W, Indices) of
        false ->
            State1 = strong_connect(W, Graph, State),
            LowV = maps:get(V, maps:get(lowlink, State1)),
            LowW = maps:get(W, maps:get(lowlink, State1)),
            State1#{lowlink := maps:put(V, min(LowV, LowW), maps:get(lowlink, State1))};
        true ->
            case sets:is_element(W, maps:get(onstack, State)) of
                true ->
                    LowV = maps:get(V, maps:get(lowlink, State)),
                    IdxW = maps:get(W, Indices),
                    State#{lowlink := maps:put(V, min(LowV, IdxW), maps:get(lowlink, State))};
                false ->
                    State
            end
    end.

pop_component(V, State) ->
    pop_component(V, State, []).

pop_component(V, State, Acc) ->
    Stack = maps:get(stack, State),
    [W | Rest] = Stack,
    Onstack1 = sets:del_element(W, maps:get(onstack, State)),
    State1 = State#{stack := Rest, onstack := Onstack1},
    Acc1 = [W | Acc],
    case W =:= V of
        true ->
            Components = maps:get(components, State1),
            State1#{components := [Acc1 | Components]};
        false ->
            pop_component(V, State1, Acc1)
    end.

main() ->
    Graph = #{0 => [1], 1 => [2], 2 => [0, 3], 3 => [4], 4 => []},
    io:format("~p~n", [find_sccs(Graph, [0, 1, 2, 3, 4])]).
