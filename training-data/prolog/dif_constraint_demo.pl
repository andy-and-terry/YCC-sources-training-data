:- dif(X, a), ( X = a -> writeln(unified) ; writeln('X = a rejected') ).
:- dif(X, a), X = b, writeln(X).
:- dif(f(X, Y), f(1, 2)), X = 1, ( Y = 2 -> writeln(allowed) ; writeln('Y = 2 rejected') ).

all_different([]).
all_different([H|T]) :- maplist(dif(H), T), all_different(T).

:- length(L, 3), all_different(L), L = [a, b, C], member(C, [a, b, c]), writeln(L).

:- dif(A, B), A = 1, B = 2, writeln(A-B).
:- ( dif(A, B), A = B -> writeln(equal) ; writeln('cannot be equal') ).
