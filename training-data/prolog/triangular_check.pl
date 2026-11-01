% N is triangular iff 8N + 1 is a perfect square.
triangular(N) :-
    S is 8*N + 1,
    R is truncate(sqrt(S) + 0.5),
    R*R =:= S.

main :-
    findall(N, (between(0, 20, N), triangular(N)), Ns),
    atomic_list_concat(Ns, ' ', Out),
    writeln(Out).

:- initialization(main).
