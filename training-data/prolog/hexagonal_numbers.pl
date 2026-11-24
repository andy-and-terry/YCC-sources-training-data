% Hexagonal numbers: n(2n-1).
:- findall(V, (between(1, 10, N), V is N * (2 * N - 1)), Vs),
   atomic_list_concat(Vs, ' ', A), writeln(A).
