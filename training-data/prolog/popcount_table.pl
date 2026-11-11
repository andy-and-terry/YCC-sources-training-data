% Population count (number of set bits) for 0..15
bits(0, 0) :- !.
bits(N, C) :- M is N >> 1, bits(M, C0), C is C0 + (N /\ 1).

main :- findall(C, (between(0, 15, N), bits(N, C)), Cs), writeln(Cs).

:- initialization(main).
