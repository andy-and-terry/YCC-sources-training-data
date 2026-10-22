% Thue-Morse: t(n) is the parity of the number of 1 bits in n
parity(0, 0) :- !.
parity(N, P) :-
    M is N >> 1,
    parity(M, Q),
    P is (N /\ 1) xor Q.

main :-
    findall(P, (between(0, 31, N), parity(N, P)), Ps),
    atomic_list_concat(Ps, Line),
    writeln(Line).

:- initialization(main).
