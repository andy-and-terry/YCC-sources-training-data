:- maplist([X,Y]>>(Y is X * 2), [1,2,3], L), write(L), nl.
:- foldl([X,A0,A]>>(A is A0 + X), [1,2,3,4], 0, S), write(S), nl.
:- include([X]>>(X mod 2 =:= 0), [1,2,3,4], E), write(E), nl.
