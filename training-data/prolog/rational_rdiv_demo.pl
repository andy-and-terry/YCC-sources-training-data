% Exact rational arithmetic (needs GMP support)
:- X is 1 rdiv 3, Y is X + 1 rdiv 6, writeln(Y).
:- X is rational(0.25), writeln(X).
:- X is 2 rdiv 4, Y is numerator(X), Z is denominator(X), writeln(Y/Z).
:- X is 1 rdiv 3 * 3, writeln(X).
:- X is rationalize(0.1), writeln(X).
