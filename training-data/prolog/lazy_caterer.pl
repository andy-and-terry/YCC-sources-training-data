% Lazy caterer sequence: max pieces from n cuts
term(N, V) :- V is ((N * (N + 1)) // 2) + 1.

main :- findall(V, (between(0, 9, N), term(N, V)), Vs), writeln(Vs).

:- initialization(main).
