:- atom_concat(hello, world, Combined),
   writeln(Combined).

:- sub_atom(programming, 0, 4, _, Prefix),
   writeln(Prefix).

:- split_string("one,two,three", ",", "", Parts),
   writeln(Parts).

:- string_upper("shout this", Upper),
   writeln(Upper).

:- atomic_list_concat([foo, bar, baz], '-', Joined),
   writeln(Joined).

:- atomic_list_concat(Parts, '-', 'foo-bar-baz'),
   writeln(Parts).
