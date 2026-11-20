% Wilson's theorem primality test.
wilson(N) :- N >= 2, N1 is N - 1, numlist(2, N1, L), foldl([I, F0, F]>>(F is F0 * I mod N), L, 1, R), R =:= N - 1.
wilson(2).
:- findall(N, (between(2, 19, N), wilson(N)), Ps), print(Ps), nl.
