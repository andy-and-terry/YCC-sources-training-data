rev(L, R) :- rev(L, [], R).
rev([], A, A).
rev([H|T], A, R) :- rev(T, [H|A], R).

:- rev([1,2,3,4], R), writeln(R).
