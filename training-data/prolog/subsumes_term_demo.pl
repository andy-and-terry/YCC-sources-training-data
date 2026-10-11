:- ( subsumes_term(f(_, b), f(a, b)) -> writeln(yes) ; writeln(no) ).
:- ( subsumes_term(f(a, b), f(_, b)) -> writeln(yes) ; writeln(no) ).
:- ( subsumes_term(f(X, X), f(a, b)) -> writeln(yes) ; writeln(no) ).
:- ( f(X, b) =@= f(Y, b) -> writeln(variant) ; writeln('not variant') ).
:- ( f(X, X) =@= f(Y, Z) -> writeln(variant) ; writeln('not variant') ).
:- ( f(a) \= f(b) -> writeln('cannot unify') ; writeln(unifiable) ).
:- ( f(X) == f(X) -> writeln(identical) ; writeln(different) ).
:- ( f(X) == f(Y) -> writeln(identical) ; writeln(different) ).
:- compare(O, f(a), g(a)), writeln(O).
:- msort([b, 2, f(x), "s", 1.5, a, Z], L), print(L), nl.
