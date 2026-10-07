% Tabling memoizes answers and makes left-recursive definitions terminate.
:- table fib/2.
fib(0, 0).
fib(1, 1).
fib(N, F) :-
    N > 1,
    N1 is N - 1, N2 is N - 2,
    fib(N1, F1), fib(N2, F2),
    F is F1 + F2.

:- table path/2.
edge(a, b). edge(b, c). edge(c, a). edge(c, d).
path(X, Y) :- path(X, Z), edge(Z, Y).
path(X, Y) :- edge(X, Y).

:- initialization(main).

main :-
    fib(100, F), format("fib(100) = ~w~n", [F]),
    findall(Y, path(a, Y), Ys0), sort(Ys0, Ys),
    format("reachable from a: ~w~n", [Ys]),
    ( path(d, _) -> writeln("d reaches something") ; writeln("d is a dead end") ),
    ( path(b, b) -> writeln("b is on a cycle") ; writeln("b is not on a cycle") ).
