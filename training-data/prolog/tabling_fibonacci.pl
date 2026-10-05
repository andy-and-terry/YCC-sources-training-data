:- table fib/2.

fib(0, 0).
fib(1, 1).
fib(N, F) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fib(N1, F1),
    fib(N2, F2),
    F is F1 + F2.

% Tabling also makes left-recursive definitions terminate.
:- table path/2.

edge(a, b).
edge(b, c).
edge(c, a).
edge(c, d).

path(X, Y) :- path(X, Z), edge(Z, Y).
path(X, Y) :- edge(X, Y).

:- fib(100, F), writeln(F).
:- findall(Y, path(a, Y), Ys), sort(Ys, S), writeln(S).
