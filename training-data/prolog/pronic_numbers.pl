% Pronic numbers n(n+1)
term(N, V) :- V is N * (N + 1).

main :- findall(V, (between(0, 9, N), term(N, V)), Vs), writeln(Vs).

:- initialization(main).
