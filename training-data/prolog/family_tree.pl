parent(tom, bob).
parent(tom, liz).
parent(bob, ann).
parent(bob, pat).

grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

sibling(X, Y) :- parent(P, X), parent(P, Y), X \= Y.

:- findall(X-Y, grandparent(X, Y), Grandparents), writeln(Grandparents).
:- findall(X-Y, sibling(X, Y), Siblings), writeln(Siblings).
