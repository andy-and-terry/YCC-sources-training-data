% Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
cows(0, 1).
cows(1, 1).
cows(2, 1).
cows(N, C) :-
    N > 2,
    N1 is N - 1,
    N3 is N - 3,
    cows(N1, C1),
    cows(N3, C3),
    C is C1 + C3.

main :-
    findall(C, (between(0, 14, N), cows(N, C)), Cs),
    atomic_list_concat(Cs, ' ', Line),
    writeln(Line).

:- initialization(main).
