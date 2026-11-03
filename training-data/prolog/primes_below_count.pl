sieve([], []).
sieve([P | Xs], [P | Ps]) :-
    exclude([X]>>(0 is X mod P), Xs, Rest),
    sieve(Rest, Ps).

count_primes_below(N, C) :-
    N2 is N - 1,
    numlist(2, N2, L),
    sieve(L, Ps),
    length(Ps, C).

:- count_primes_below(100, C), writeln(C).
