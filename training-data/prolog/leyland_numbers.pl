% Leyland numbers: X^Y + Y^X for X >= Y >= 2.
leyland(X, Y, L) :- L is X**Y + Y**X.

main :-
    findall(L, (between(2, 4, X), between(2, X, Y), leyland(X, Y, L)), Ls),
    atomic_list_concat(Ls, ' ', Out),
    writeln(Out).

:- initialization(main).
