parent(tom, bob).
parent(bob, ann).
parent(ann, joe).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Y) :- parent(X, Z), ancestor(Z, Y).

:- forall(ancestor(tom, D), (write(D), nl)).
