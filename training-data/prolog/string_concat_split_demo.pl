:- initialization(main).

main :-
    atomic_list_concat([a, b, c], '-', Joined), writeln(Joined),
    atomic_list_concat(Parts, ',', 'x,y,z'), writeln(Parts),
    split_string("  hello world  ", " ", " ", Words), writeln(Words),
    string_concat("foo", "bar", S), writeln(S),
    sub_atom(hello_world, 0, 5, _, Prefix), writeln(Prefix),
    upcase_atom(hello, Up), writeln(Up),
    string_length("prolog", Len), writeln(Len).
