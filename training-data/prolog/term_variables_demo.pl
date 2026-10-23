% term_variables/2 lists the distinct unbound variables of a term, left to right.
:- term_variables(f(X, g(Y, X), _Z), Vs), length(Vs, N), format("~d variables~n", [N]),
   Vs = [A, B, _], A = 1, B = 2, writeln(f(X, g(Y, X), _)).

% A term with no variables is ground.
:- term_variables(point(1, 2), Vs), writeln(Vs).

% Variables of a clause body tell us what a goal depends on.
shared_vars(A, B, Shared) :-
    term_variables(A, VA),
    term_variables(B, VB),
    include(occurs_in(VB), VA, Shared).

occurs_in(Vars, V) :- member(W, Vars), V == W, !.

:- shared_vars(p(X, Y), q(Y, Z), S), ( S = [V], V == Y -> writeln(shares_y) ; writeln(other) ),
   ( var(Z) -> writeln(z_still_free) ; true ), ( var(X) -> writeln(x_still_free) ; true ).

% Binding variables in a copy leaves the original untouched.
:- T = foo(_, _), term_variables(T, V1), copy_term(T, C), term_variables(C, V2),
   ( V1 == V2 -> writeln(same) ; writeln(different) ).
