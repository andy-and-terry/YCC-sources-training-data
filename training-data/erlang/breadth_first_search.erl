-module(breadth_first_search).
-export([bfs/2]).

bfs(Graph, Start) ->
    bfs_loop(Graph, [Start], [Start], []).

bfs_loop(_Graph, [], _Visited, Order) ->
    lists:reverse(Order);
bfs_loop(Graph, [Node | Rest], Visited, Order) ->
    Neighbors = maps:get(Node, Graph, []),
    NewNeighbors = [N || N <- Neighbors, not lists:member(N, Visited)],
    bfs_loop(Graph, Rest ++ NewNeighbors, Visited ++ NewNeighbors, [Node | Order]).

main() ->
    Graph = #{a => [b, c], b => [d], c => [d], d => []},
    io:format("~p~n", [bfs(Graph, a)]).
