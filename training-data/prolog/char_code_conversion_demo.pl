:- initialization(main).

main :-
    char_code(a, C), writeln(C),
    atom_codes(abc, Codes), writeln(Codes),
    atom_chars(hello, Chars), writeln(Chars),
    number_codes(N, "42"), Y is N + 1, writeln(Y),
    atom_number('3.5', F), writeln(F),
    term_to_atom(foo(1, bar), A), writeln(A),
    atom_string(At, "text"), writeln(At).
