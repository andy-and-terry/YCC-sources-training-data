-module(digraph_demo).
-export([run/0]).

run() ->
    Graph = digraph:new(),
    digraph:add_vertex(Graph, a),
    digraph:add_vertex(Graph, b),
    digraph:add_vertex(Graph, c),
    digraph:add_vertex(Graph, d),
    digraph:add_edge(Graph, a, b),
    digraph:add_edge(Graph, b, c),
    digraph:add_edge(Graph, a, d),
    digraph:add_edge(Graph, d, c),
    io:format("~p~n", [lists:sort(digraph:vertices(Graph))]),
    io:format("~p~n", [digraph:get_path(Graph, a, c)]),
    io:format("~p~n", [digraph_utils:topsort(Graph)]),
    digraph:delete(Graph).
