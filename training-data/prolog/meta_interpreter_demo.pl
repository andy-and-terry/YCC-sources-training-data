% A vanilla meta-interpreter: solve/1 runs Prolog by walking clause bodies.
:- dynamic parent/2, ancestor/2.

parent(tom, bob).
parent(bob, ann).
parent(ann, joe).

ancestor(X, Y) :- parent(X, Y).
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).

solve(true) :- !.
solve((A, B)) :- !, solve(A), solve(B).
solve(H) :- predicate_property(H, built_in), !, call(H).
solve(H) :- clause(H, Body), solve(Body).

% Variant that also counts resolution steps.
solve_count(true, 0) :- !.
solve_count((A, B), N) :- !, solve_count(A, N1), solve_count(B, N2), N is N1 + N2.
solve_count(H, 0) :- predicate_property(H, built_in), !, call(H).
solve_count(H, N) :- clause(H, Body), solve_count(Body, N0), N is N0 + 1.

:- findall(D, solve(ancestor(tom, D)), Ds), writeln(Ds).
:- solve_count(ancestor(tom, joe), N), format("steps: ~d~n", [N]).
