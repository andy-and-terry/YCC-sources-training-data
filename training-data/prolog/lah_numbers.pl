fact(0, 1) :- !.
fact(N, F) :- N1 is N - 1, fact(N1, F1), F is N * F1.

comb(N, K, C) :- fact(N, FN), fact(K, FK), D is N - K, fact(D, FD), C is FN // (FK * FD).

lah(N, K, L) :-
    N1 is N - 1, K1 is K - 1,
    comb(N1, K1, C), fact(N, FN), fact(K, FK),
    L is C * FN // FK.

row(N) :- findall(L, (between(1, N, K), lah(N, K, L)), Ls), writeln(Ls).

:- forall(between(1, 5, N), row(N)).
