% Centered square numbers: n^2 + (n+1)^2.
:- findall(V, (between(0, 9, N), V is N * N + (N + 1) * (N + 1)), Vs),
   atomic_list_concat(Vs, ' ', A), writeln(A).
