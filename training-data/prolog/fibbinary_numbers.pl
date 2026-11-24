% Fibbinary numbers: no two adjacent 1 bits.
fibbinary(N) :- N /\ (N >> 1) =:= 0.

:- findall(N, (between(0, 49, N), fibbinary(N)), Ns), atomic_list_concat(Ns, ' ', A), writeln(A).
