shift_char(Shift, C, S) :-
    C >= 0'a, C =< 0'z, !,
    S is (C - 0'a + Shift) mod 26 + 0'a.
shift_char(Shift, C, S) :-
    C >= 0'A, C =< 0'Z, !,
    S is (C - 0'A + Shift) mod 26 + 0'A.
shift_char(_, C, C).

caesar(Shift, Plain, Cipher) :-
    string_codes(Plain, Codes),
    maplist(shift_char(Shift), Codes, Out),
    string_codes(Cipher, Out).

:- caesar(3, "Hello, World!", C), writeln(C).
:- caesar(3, "Hello, World!", C), caesar(-3, C, P), writeln(P).
