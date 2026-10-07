% Converting between atoms, codes, and chars.
:- atom_codes(abc, Codes), write(Codes), nl.
:- atom_chars(hello, Chars), write(Chars), nl.
:- atom_chars(X, [w, o, r, l, d]), write(X), nl.
:- char_code(Ch, 65), write(Ch), nl.
:- atom_length('prolog', N), write(N), nl.
:- upcase_atom('mixed Case', U), write(U), nl.
:- atom_number('42', N), Y is N + 1, write(Y), nl.
:- number_codes(N, "17"), write(N), nl.

caesar_shift(Shift, In, Out) :-
    atom_codes(In, Codes),
    maplist(shift_code(Shift), Codes, Shifted),
    atom_codes(Out, Shifted).

shift_code(S, C, R) :- C >= 0'a, C =< 0'z, !, R is (C - 0'a + S) mod 26 + 0'a.
shift_code(_, C, C).

:- caesar_shift(3, 'hello world', R), write(R), nl.
