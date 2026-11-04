interleave([], Ys, Ys) :- !.
interleave(Xs, [], Xs) :- !.
interleave([X | Xs], [Y | Ys], [X, Y | Zs]) :- interleave(Xs, Ys, Zs).

:- string_chars("abc", A), string_chars("12345", B),
   interleave(A, B, C), string_chars(S, C), writeln(S).
