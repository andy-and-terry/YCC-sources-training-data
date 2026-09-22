node(a). node(b). node(c). node(d).
edge(a, b). edge(a, c). edge(b, c). edge(c, d).

conflict(Node, Color, Acc) :-
    member(Neighbor-Color, Acc),
    ( edge(Node, Neighbor) ; edge(Neighbor, Node) ).

color_map([], _, Acc, Acc).
color_map([Node|Nodes], Colors, Acc, Assignment) :-
    member(Color, Colors),
    \+ conflict(Node, Color, Acc),
    color_map(Nodes, Colors, [Node-Color|Acc], Assignment).

:- findall(N, node(N), Nodes),
   color_map(Nodes, [red, green, blue], [], Assignment),
   writeln(Assignment).
