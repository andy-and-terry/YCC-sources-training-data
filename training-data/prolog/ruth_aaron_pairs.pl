% Sum of prime factors counted with multiplicity.
sopfr(N, S) :- sopfr(N, 2, 0, S).

sopfr(1, _, Acc, Acc) :- !.
sopfr(N, P, Acc, S) :- P*P > N, !, S is Acc + N.
sopfr(N, P, Acc, S) :- N mod P =:= 0, !, N1 is N // P, Acc1 is Acc + P, sopfr(N1, P, Acc1, S).
sopfr(N, P, Acc, S) :- P1 is P + 1, sopfr(N, P1, Acc, S).

main :-
    findall(N, (between(2, 109, N), M is N + 1, sopfr(N, S), sopfr(M, S)), Ns),
    atomic_list_concat(Ns, ' ', Out),
    writeln(Out).

:- initialization(main).
