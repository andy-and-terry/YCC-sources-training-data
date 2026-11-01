% Positive N expressible as A*A + B*B with A, B >= 0.
representable(N) :-
    between(0, N, A), A*A =< N,
    between(A, N, B), A*A + B*B =:= N, !.

main :-
    findall(N, (between(1, 30, N), representable(N)), Ns),
    atomic_list_concat(Ns, ' ', Out),
    writeln(Out).

:- initialization(main).
