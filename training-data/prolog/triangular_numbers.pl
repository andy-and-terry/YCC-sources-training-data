triangular(N, T) :- T is N * (N + 1) // 2.

:- findall(T, (between(1, 10, N), triangular(N, T)), L), writeln(L).
