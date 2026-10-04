% Tabling memoizes answers, turning exponential recursion into linear time.
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

:- fib(30, F), write(F), nl.
:- fib(100, F), write(F), nl.

% tabling also makes left-recursive definitions terminate
:- table path/2.
edge(a, b).
edge(b, c).
edge(c, a).
path(X, Y) :- path(X, Z), edge(Z, Y).
path(X, Y) :- edge(X, Y).

:- findall(Y, path(a, Y), Ys), sort(Ys, S), write(S), nl.
