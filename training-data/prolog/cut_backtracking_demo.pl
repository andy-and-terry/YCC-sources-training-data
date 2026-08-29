classify(N, negative) :- N < 0, !.
classify(0, zero) :- !.
classify(N, even) :- 0 is N mod 2, !.
classify(_, odd).

:- classify(-5, C), writeln(C).
:- classify(0, C), writeln(C).
:- classify(4, C), writeln(C).
:- classify(7, C), writeln(C).
