:- dynamic(parent/2).

init_uf(N) :-
    retractall(parent(_, _)),
    numlist(0, N, Nodes),
    forall(member(X, Nodes), assertz(parent(X, X))).

uf_find(X, X) :- parent(X, X), !.
uf_find(X, Root) :-
    parent(X, P),
    P \= X,
    uf_find(P, Root).

uf_union(X, Y) :-
    uf_find(X, RootX),
    uf_find(Y, RootY),
    (RootX \= RootY -> retract(parent(RootX, RootX)), assertz(parent(RootX, RootY)) ; true).

:- init_uf(5), uf_union(0, 1), uf_union(1, 2),
   uf_find(0, R1), uf_find(2, R2), uf_find(3, R3),
   (R1 =:= R2 -> writeln(true) ; writeln(false)),
   (R1 =:= R3 -> writeln(true) ; writeln(false)).
