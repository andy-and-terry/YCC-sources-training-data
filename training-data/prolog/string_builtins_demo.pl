% SWI-Prolog string objects (double-quoted text) and their predicates.
:- string_concat("foo", "bar", S), write(S), nl.
:- string_length("prolog", N), write(N), nl.
:- string_upper("shout", U), write(U), nl.
:- split_string("a,b,,c", ",", "", Parts), write(Parts), nl.
:- split_string("  padded  ", "", " ", [Trimmed]), write(Trimmed), nl.
:- sub_string("hello world", 6, 5, _, W), write(W), nl.
:- string_chars(S, [h, i]), string(S), write(S), nl.
:- number_string(N, " 42 "), Y is N * 2, write(Y), nl.
:- term_to_atom(foo(X, bar), A), write(A), nl.
:- format("~w has ~d chars~n", ["text", 4]).
:- format("~a|~t~w~10||~n", [left, right]).
:- format("~2f ~e ~s~n", [3.14159, 100.0, [104, 105]]).
