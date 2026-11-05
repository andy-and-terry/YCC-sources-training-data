age(ann, 30). age(bob, 25). age(cy, 30).

:- findall(N, age(N, _), L), write(L), nl.
:- setof(A-N, age(N, A), L), write(L), nl.
:- (bagof(N, age(N, 99), L) -> write(L) ; write(none)), nl.
