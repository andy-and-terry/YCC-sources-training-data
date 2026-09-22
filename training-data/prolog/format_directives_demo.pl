% format/2 renders a control string against an argument list: ~a for
% atoms, ~d for integers, ~Nf for fixed-point floats, ~w for arbitrary
% terms via write/1, ~n for a newline, and ~t/~N| to pad output out to a
% given column (handy for aligning a report into columns).
:- format("Hello, ~a! You are ~d years old.~n", [alice, 30]).

:- format("Pi is approximately ~2f~n", [3.14159]).

:- format("List: ~w~n", [[1, 2, 3]]).

:- forall(
       member(Name-Score, [alice-95, bob-82, carol-77]),
       format("~w~t~15|~d~n", [Name, Score])
   ).
