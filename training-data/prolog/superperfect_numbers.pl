sigma(N, S) :- aggregate_all(sum(D), (between(1, N, D), N mod D =:= 0), S).

superperfect(N) :- sigma(N, S1), sigma(S1, S2), S2 =:= 2 * N.

main :- findall(N, (between(1, 99, N), superperfect(N)), L), write(L), nl.
% [2,4,16,64]
:- initialization(main).
