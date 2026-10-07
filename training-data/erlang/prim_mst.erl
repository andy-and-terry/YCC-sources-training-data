-module(prim_mst).
-export([mst_weight/2]).

%% Prim's algorithm: grow a minimum spanning tree one node at a time,
%% always adding the cheapest edge that connects the current tree to a
%% node outside it. Undirected edges are given once as {From, To, Weight}
%% and mirrored into both adjacency lists.

mst_weight(NumNodes, Edges) ->
    Adj = build_adjacency(NumNodes, Edges),
    Visited = sets:from_list([0]),
    grow(Adj, Visited, 0).

build_adjacency(NumNodes, Edges) ->
    Empty = maps:from_list([{N, []} || N <- lists:seq(0, NumNodes - 1)]),
    lists:foldl(
        fun({From, To, Weight}, Acc) ->
            Acc1 = maps:update_with(From, fun(L) -> [{To, Weight} | L] end, Acc),
            maps:update_with(To, fun(L) -> [{From, Weight} | L] end, Acc1)
        end,
        Empty,
        Edges).

grow(Adj, Visited, Total) ->
    Candidates = [{W, To} || From <- sets:to_list(Visited),
                             {To, W} <- maps:get(From, Adj),
                             not sets:is_element(To, Visited)],
    case Candidates of
        [] ->
            Total;
        _ ->
            {MinW, MinTo} = lists:min(Candidates),
            grow(Adj, sets:add_element(MinTo, Visited), Total + MinW)
    end.
