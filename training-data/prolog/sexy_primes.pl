% Sexy primes below 100; expect 16 pairs.
prime(N) :- N > 1, \+ (between(2, N, D), D * D =< N, N mod D =:= 0).

:- aggregate_all(count, (between(2, 99, P), Q is P + 6, prime(P), prime(Q)), C), writeln(C).
