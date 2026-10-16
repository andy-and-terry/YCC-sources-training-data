:- use_module(library(yall)).
:- use_module(library(apply)).

:- maplist([X, Y]>>(Y is X * X), [1, 2, 3, 4], Squares), writeln(Squares).

:- N = 10, maplist({N}/[X, Y]>>(Y is X + N), [1, 2, 3], Shifted), writeln(Shifted).

:- foldl([X, A0, A]>>(A is max(X, A0)), [3, 9, 2, 7], 0, Max), writeln(Max).

:- include([X]>>(X mod 2 =:= 0), [1, 2, 3, 4, 5, 6], Evens), writeln(Evens).

compose(F, G, X, Z) :- call(G, X, Y), call(F, Y, Z).
:- maplist(compose([A, B]>>(B is A + 1), [A, B]>>(B is A * 2)), [1, 2, 3], R), writeln(R).
