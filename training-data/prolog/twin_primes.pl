% Twin primes: pairs (p, p+2) both prime; print the lesser of each pair.
prime(N) :- N >= 2, \+ (between(2, N, D), D * D =< N, N mod D =:= 0).

main :-
    findall(P, (between(2, 99, P), Q is P + 2, prime(P), prime(Q)), L),
    atomic_list_concat(L, ' ', Out),
    writeln(Out).

:- initialization(main).
