% between/3 enumerates integers; succ/2 and plus/3 are reversible arithmetic.
squares_up_to(N, Squares) :-
    findall(S, (between(1, N, X), S is X * X), Squares).

:- squares_up_to(6, L), write(L), nl.
:- succ(X, 5), write(X), nl.
:- succ(3, Y), write(Y), nl.
:- plus(2, Z, 10), write(Z), nl.
:- forall(between(1, 3, I), (write(I), write(' '))), nl.
:- between(1, inf, N), N * N > 50, !, write(N), nl.
