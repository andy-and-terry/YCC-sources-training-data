% Tetrahedral numbers n(n+1)(n+2)/6
term(N, V) :- V is ((N * (N + 1)) * (N + 2)) // 6.

main :- findall(V, (between(0, 9, N), term(N, V)), Vs), writeln(Vs).

:- initialization(main).
