parent(tom, bob). parent(bob, ann). parent(bob, joe).
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).
sibling(X, Y) :- parent(P, X), parent(P, Y), X \= Y.
:- initialization(main).
main :- forall(grandparent(tom, G), writeln(G)), forall(sibling(ann, S), writeln(S)).
