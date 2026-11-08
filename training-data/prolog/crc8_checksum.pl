crc_bits(C, 0, C) :- !.
crc_bits(C, N, R) :-
    ( C /\ 0x80 =\= 0 -> C1 is ((C << 1) xor 0x07) /\ 0xFF ; C1 is (C << 1) /\ 0xFF ),
    N1 is N - 1,
    crc_bits(C1, N1, R).

crc8(Codes, Crc) :- foldl([B, A, R]>>(X is A xor B, crc_bits(X, 8, R)), Codes, 0, Crc).

:- string_codes("123456789", Cs), crc8(Cs, C), format("~16r~n", [C]).
