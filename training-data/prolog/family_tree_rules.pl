parent(tom, bob).
parent(bob, ann).
parent(bob, pat).
grandparent(X, Z) :- parent(X, Y), parent(Y, Z).
sibling(X, Y) :- parent(P, X), parent(P, Y), X \= Y.

:- findall(G, grandparent(tom, G), L), writeln(L).
:- sibling(ann, S), writeln(S).
