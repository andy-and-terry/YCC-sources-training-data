:- use_module(library(ugraphs)).

% Graphs are lists of Vertex-Neighbours pairs.
:- vertices_edges_to_ugraph([a, b, c, d, e], [a-b, b-c, a-c, d-e], G),
   writeln(G),
   vertices(G, Vs), writeln(vertices(Vs)),
   edges(G, Es), writeln(edges(Es)),
   neighbours(a, G, Ns), writeln(neighbours(a, Ns)),
   reachable(a, G, R), writeln(reachable(a, R)),
   top_sort(G, Order), writeln(top_sort(Order)).

% Transposing reverses every edge.
:- vertices_edges_to_ugraph([], [1-2, 2-3], G), transpose_ugraph(G, T), writeln(T).

% Adding and deleting edges returns a new graph.
:- vertices_edges_to_ugraph([], [x-y], G0),
   add_edges(G0, [y-z], G1), writeln(G1),
   del_edges(G1, [x-y], G2), writeln(G2).
