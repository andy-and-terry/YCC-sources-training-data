% Pernicious numbers: the popcount is prime.
prime(N) :- N >= 2, \+ (between(2, N, D), D*D =< N, N mod D =:= 0).

popcount(0, 0) :- !.
popcount(N, C) :- B is N /\ 1, M is N >> 1, popcount(M, C0), C is C0 + B.

main :-
    findall(N, (between(1, 20, N), popcount(N, C), prime(C)), Ns),
    atomic_list_concat(Ns, ' ', Out),
    writeln(Out).

:- initialization(main).
