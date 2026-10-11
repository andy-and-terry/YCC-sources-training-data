% freeze/2 delays a goal until its variable becomes bound.
:- freeze(X, writeln(got(X))), writeln(before), X = 42, writeln(after).

:- freeze(X, X > 0), ( X = -1 -> writeln(accepted) ; writeln('constraint rejected -1') ).

:- freeze(A, writeln(a(A))), freeze(B, writeln(b(B))), B = 2, A = 1.

:- frozen(X, G0), writeln(G0), freeze(X, true), frozen(X, G1), writeln(G1).

% when/2 waits on a condition over several variables.
:- when(ground(X + Y), (Z is X + Y, writeln(sum(Z)))), X = 3, writeln(x_set), Y = 4.
