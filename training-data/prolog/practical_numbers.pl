% Practical numbers: every m in 1..n is a sum of distinct divisors of n.
% Reachable subset sums are kept as a bitmask integer.
practical(N) :-
    findall(D, (between(1, N, D), N mod D =:= 0), Ds),
    foldl([D, A, B]>>(B is A \/ (A << D)), Ds, 1, Reach),
    Mask is (1 << (N + 1)) - 1,
    Reach /\ Mask =:= Mask.

main :-
    findall(N, (between(1, 40, N), practical(N)), L),
    atomic_list_concat(L, ' ', Out),
    writeln(Out).

:- initialization(main).
