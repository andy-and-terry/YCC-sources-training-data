:- findall(S, (between(1, 6, N), S is N * N), L), write(L), nl.
:- succ(X, 5), write(X), nl.
:- X is 17 mod 5, Y is 17 // 5, write(X-Y), nl.
