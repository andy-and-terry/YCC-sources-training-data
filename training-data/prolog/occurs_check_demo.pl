% Standard unification skips the occurs check, so X = f(X) builds a cyclic term.
:- ( unify_with_occurs_check(X, f(X)) -> writeln(unified) ; writeln('occurs check failed') ).
:- X = f(X), ( cyclic_term(X) -> writeln(cyclic) ; writeln(acyclic) ).
:- ( acyclic_term(f(a, g(b))) -> writeln(acyclic) ; writeln(cyclic) ).
:- unify_with_occurs_check(f(X, b), f(a, Y)), writeln(X-Y).
:- ( unify_with_occurs_check(g(X, X), g(Y, h(Y))) -> writeln(yes) ; writeln(no) ).
:- ( f(X, X) = f(a, b) -> writeln(unified) ; writeln('different constants') ).
