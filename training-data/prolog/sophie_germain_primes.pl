prime(N) :- N >= 2, \+ (between(2, N, D), D * D =< N, N mod D =:= 0).

sophie_germain(P) :- prime(P), Q is 2 * P + 1, prime(Q).

main :- findnsols(10, P, (between(2, inf, P), sophie_germain(P)), [L]), !, write(L), nl.
% [2,3,5,11,23,29,41,53,83,89]
:- initialization(main).
