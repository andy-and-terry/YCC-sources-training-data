:- atom_number('42', N), Y is N + 1, writeln(Y).
:- atom_number('3.14', F), writeln(F).
:- ( atom_number(abc, N) -> writeln(N) ; writeln('not a number') ).
:- atom_number(A, 99), writeln(A).
:- number_codes(N, "123"), writeln(N).
:- number_codes(456, Codes), atom_codes(A, Codes), atom_length(A, Len), writeln(A-Len).
:- atom_to_term('foo(X, Y, X)', T, Bindings), writeln(T-Bindings).
:- catch(atom_length(123456, L), _, L = error), writeln(L).
:- number_string(N, "77"), writeln(N).
:- term_string(T, "point(1, 2)"), arg(1, T, X), writeln(X).
