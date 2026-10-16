:- string_upper("shout this", U), writeln(U).
:- string_lower("QUIET NOW", L), writeln(L).
:- upcase_atom('mixed Case', A), writeln(A).
:- downcase_atom('MiXeD', A), writeln(A).
:- char_type(X, to_lower(a)), writeln(X).
:- char_type(a, to_lower(U)), writeln(U).

capitalize(Word, Cap) :-
    sub_atom(Word, 0, 1, _, First),
    sub_atom(Word, 1, _, 0, Rest),
    upcase_atom(First, UFirst),
    atom_concat(UFirst, Rest, Cap).

:- maplist(capitalize, [alpha, beta, gamma], Caps), writeln(Caps).
:- normalize_space(atom(A), '  too    many   spaces  '), writeln(A).
:- string_code(1, "abc", C), char_code(Ch, C), writeln(Ch).
