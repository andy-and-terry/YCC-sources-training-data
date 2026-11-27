fletcher16(Codes, Sum) :-
    foldl(step, Codes, 0-0, S1-S2),
    Sum is (S2 << 8) \/ S1.

step(C, A-B, A1-B1) :-
    A1 is (A + C) mod 255,
    B1 is (B + A1) mod 255.

:- atom_codes(abcde, Cs), fletcher16(Cs, S), format("~16r~n", [S]).
