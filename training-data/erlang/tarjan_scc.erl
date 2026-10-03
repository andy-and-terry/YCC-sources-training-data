-module(tarjan_scc).
-export([scc/2]).

%% Tarjan's strongly-connected-components algorithm. Since Erlang has no
%% mutable local variables, the usual index/lowlink/stack bookkeeping is
%% threaded through an explicit #state{} record instead of being held in
%% closures over mutable locals.

-record(state, {index = #{}, lowlink = #{}, on_stack = #{}, stack = [],
                counter = 0, sccs = []}).

scc(NumNodes, Edges) ->
    Adj = build_adjacency(NumNodes, Edges),
    Nodes = lists:seq(0, NumNodes - 1),
    FinalState = lists:foldl(
        fun(Node, St) ->
            case maps:is_key(Node, St#state.index) of
                true -> St;
                false -> strongconnect(Node, Adj, St)
            end
        end,
        #state{},
        Nodes),
    FinalState#state.sccs.

build_adjacency(NumNodes, Edges) ->
    Empty = maps:from_list([{N, []} || N <- lists:seq(0, NumNodes - 1)]),
    lists:foldl(
        fun({From, To}, Acc) ->
            maps:update_with(From, fun(L) -> [To | L] end, Acc)
        end,
        Empty,
        Edges).

strongconnect(Node, Adj, St0) ->
    Idx = St0#state.counter,
    St1 = St0#state{
        index = maps:put(Node, Idx, St0#state.index),
        lowlink = maps:put(Node, Idx, St0#state.lowlink),
        counter = Idx + 1,
        stack = [Node | St0#state.stack],
        on_stack = maps:put(Node, true, St0#state.on_stack)
    },
    Neighbors = maps:get(Node, Adj),
    St2 = lists:foldl(
        fun(Neighbor, St) -> visit_neighbor(Node, Neighbor, Adj, St) end,
        St1,
        Neighbors),
    NodeLow = maps:get(Node, St2#state.lowlink),
    NodeIdx = maps:get(Node, St2#state.index),
    case NodeLow =:= NodeIdx of
        true -> pop_scc(Node, St2);
        false -> St2
    end.

visit_neighbor(Node, Neighbor, Adj, St) ->
    case maps:is_key(Neighbor, St#state.index) of
        false ->
            St1 = strongconnect(Neighbor, Adj, St),
            NodeLow = maps:get(Node, St1#state.lowlink),
            NeighborLow = maps:get(Neighbor, St1#state.lowlink),
            St1#state{lowlink = maps:put(Node, min(NodeLow, NeighborLow), St1#state.lowlink)};
        true ->
            case maps:get(Neighbor, St#state.on_stack, false) of
                true ->
                    NodeLow = maps:get(Node, St#state.lowlink),
                    NeighborIdx = maps:get(Neighbor, St#state.index),
                    St#state{lowlink = maps:put(Node, min(NodeLow, NeighborIdx), St#state.lowlink)};
                false ->
                    St
            end
    end.

pop_scc(Node, St) ->
    pop_scc(Node, St, []).

pop_scc(Node, St, Acc) ->
    [Top | Rest] = St#state.stack,
    St1 = St#state{stack = Rest, on_stack = maps:put(Top, false, St#state.on_stack)},
    Acc1 = [Top | Acc],
    case Top =:= Node of
        true -> St1#state{sccs = [Acc1 | St1#state.sccs]};
        false -> pop_scc(Node, St1, Acc1)
    end.
