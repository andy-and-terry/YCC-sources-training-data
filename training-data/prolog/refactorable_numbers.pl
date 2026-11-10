tau(N, T) :- aggregate_all(count, (between(1, N, D), N mod D =:= 0), T).

refactorable(N) :- tau(N, T), N mod T =:= 0.

main :- findall(N, (between(1, 59, N), refactorable(N)), L), write(L), nl.
% [1,2,8,9,12,18,24,36,40,56]
:- initialization(main).
