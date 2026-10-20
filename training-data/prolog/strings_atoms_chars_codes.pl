main :-
    atom_length(hello, L1), atom_concat(foo, bar, A1), format("~w ~w~n", [L1, A1]),
    atom_chars(abc, Cs), atom_codes(abc, Co), format("~w ~w~n", [Cs, Co]),
    upcase_atom('hello world', U), downcase_atom('ABC', D), format("~w ~w~n", [U, D]),
    sub_atom(hello_world, 6, 5, _, Sub), format("~w~n", [Sub]),
    atom_number('42', N), atom_number(A2, 7), format("~w ~w~n", [N, A2]),
    atomic_list_concat([a, b, c], '-', J), atomic_list_concat(Parts, ',', 'x,y,z'), format("~w ~w~n", [J, Parts]),
    string_concat("ab", "cd", S1), string_length(S1, SL), string_upper(S1, SU), format("~w ~w ~w~n", [S1, SL, SU]),
    split_string("a b  c", " ", "", Sp), format("~q~n", [Sp]),
    sub_string("hello", 1, 3, _, SS), string_chars(SC, [h, i]), format("~w ~w~n", [SS, SC]),
    term_to_atom(foo(X, bar), T), format("~w~n", [T]), X = 1,
    format("~a|~10|~w~n", [left, right]),
    format("~t~w~10||~w~t~10+|~n", [r, l]),
    format("~e ~4f ~d ~D ~s ~q~n", [1.5, 2.0, 42, 1234567, [104, 105], 'quoted atom']),
    char_code(Ch, 0'a), format("~w~n", [Ch]),
    nb_setval(k, 5), nb_getval(k, V), format("~w~n", [V]),
    sformat_test.
sformat_test :- with_output_to(string(S), (write(a), write(1))), string_length(S, L), format("~w ~w~n", [S, L]).
:- initialization(main).
