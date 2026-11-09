:- forall(between(1, 5, X), (Y is X * X, format("~w ", [Y]))), nl.
:- succ(X, 4), writeln(X).
:- length(L, 3), writeln(L).
