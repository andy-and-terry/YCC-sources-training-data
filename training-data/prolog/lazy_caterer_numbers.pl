% Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
pieces(N, P) :- P is N * (N + 1) // 2 + 1.

main :-
    numlist(0, 9, Ns),
    maplist(pieces, Ns, Ps),
    atomic_list_concat(Ps, ' ', Out),
    writeln(Out).

:- initialization(main).
