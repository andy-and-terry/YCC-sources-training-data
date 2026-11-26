% Twin primes below 100; expect 8.
prime(N) :- N > 1, \+ (between(2, N, D), D * D =< N, N mod D =:= 0).

:- aggregate_all(count, (between(2, 99, P), P2 is P + 2, prime(P), prime(P2)), C), writeln(C).
