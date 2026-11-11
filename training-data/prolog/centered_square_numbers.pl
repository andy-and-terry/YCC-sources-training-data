% Centered square numbers 2n(n+1)+1
term(N, V) :- V is ((2 * N) * (N + 1)) + 1.

main :- findall(V, (between(0, 9, N), term(N, V)), Vs), writeln(Vs).

:- initialization(main).
