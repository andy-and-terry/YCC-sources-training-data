% Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
fact(0, 1) :- !.
fact(N, F) :- N1 is N - 1, fact(N1, F1), F is N * F1.

comb(N, K, C) :-
    fact(N, FN), fact(K, FK), M is N - K, fact(M, FM),
    C is FN // (FK * FM).

lah(N, K, L) :-
    N1 is N - 1, K1 is K - 1,
    comb(N1, K1, C), fact(N, FN), fact(K, FK),
    L is C * FN // FK.

main :-
    N = 5,
    findall(L, (between(1, N, K), lah(N, K, L)), Ls),
    atomic_list_concat(Ls, ' ', Out),
    writeln(Out).

:- initialization(main).
