% Pentagonal numbers: n(3n-1)/2.
:- findall(V, (between(1, 10, N), V is N * (3 * N - 1) // 2), Vs),
   atomic_list_concat(Vs, ' ', A), writeln(A).
