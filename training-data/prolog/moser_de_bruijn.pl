% Moser-de Bruijn sequence: binary digits of n read in base 4.
moser(0, 0) :- !.
moser(N, M) :- N1 is N >> 1, moser(N1, M1), M is (N /\ 1) + 4 * M1.

:- findall(M, (between(0, 11, N), moser(N, M)), Ms), atomic_list_concat(Ms, ' ', A), writeln(A).
