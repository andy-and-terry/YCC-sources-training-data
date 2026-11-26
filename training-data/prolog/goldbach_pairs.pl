% Goldbach partitions of 100; expect 6.
prime(N) :- N > 1, \+ (between(2, N, D), D * D =< N, N mod D =:= 0).

:- findall(P-Q, (between(2, 50, P), Q is 100 - P, prime(P), prime(Q)), Ps),
   length(Ps, L), writeln(L), writeln(Ps).
