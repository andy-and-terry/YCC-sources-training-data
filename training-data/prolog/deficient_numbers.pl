sigma(N, S) :- findall(D, (between(1, N, D), N mod D =:= 0), Ds), sum_list(Ds, S).

deficient(N) :- between(1, 20, N), sigma(N, S), S < 2 * N.

:- findall(N, deficient(N), L), write(L), nl.
