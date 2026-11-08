rot47_char(C, R) :-
    ( C >= 33, C =< 126 -> R is 33 + (C - 33 + 47) mod 94 ; R = C ).

rot47(Text, Out) :-
    string_codes(Text, Cs),
    maplist(rot47_char, Cs, Rs),
    string_codes(Out, Rs).

:- rot47("Hello, World!", E), writeln(E), rot47(E, B), writeln(B).
