rot13_char(C, R) :-
    (   char_type(C, lower) -> Base = 0'a
    ;   char_type(C, upper) -> Base = 0'A
    ),
    !,
    char_code(C, Code),
    NewCode is (Code - Base + 13) mod 26 + Base,
    char_code(R, NewCode).
rot13_char(C, C).

rot13(Text, Result) :-
    atom_chars(Text, Chars),
    maplist(rot13_char, Chars, Rotated),
    atom_chars(Result, Rotated).

:- rot13('Hello, World!', R), writeln(R), rot13(R, Back), writeln(Back).
