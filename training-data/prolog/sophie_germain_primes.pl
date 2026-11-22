% Sophie Germain primes: p prime and 2p + 1 prime.
prime(N) :- N >= 2, \+ (between(2, N, D), D * D =< N, N mod D =:= 0).

main :-
    findall(P, (between(2, 99, P), Q is 2 * P + 1, prime(P), prime(Q)), L),
    atomic_list_concat(L, ' ', Out),
    writeln(Out).

:- initialization(main).
