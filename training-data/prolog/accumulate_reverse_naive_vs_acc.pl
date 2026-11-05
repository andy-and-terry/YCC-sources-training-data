rev(L, R) :- rev(L, [], R).
rev([], A, A).
rev([H|T], A, R) :- rev(T, [H|A], R).

:- rev([a,b,c,d], R), write(R), nl.
