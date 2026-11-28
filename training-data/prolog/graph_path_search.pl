edge(a, b). edge(b, c). edge(c, d). edge(a, d).

path(X, X, [X]).
path(X, Y, [X|P]) :- edge(X, Z), path(Z, Y, P).

:- findall(P, path(a, d, P), Ps), format("~w~n", [Ps]).
