parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).

grandparent(X, Z) :- parent(X, Y), parent(Y, Z).

sibling(X, Y) :- parent(P, X), parent(P, Y), X \= Y.

:- forall(grandparent(tom, G), (write(tom), write(' is grandparent of '), writeln(G))).
:- forall(sibling(ann, S), (write(ann), write(' is sibling of '), writeln(S))).
