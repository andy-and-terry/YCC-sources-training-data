% D(M, N) = D(M-1, N) + D(M, N-1) + D(M-1, N-1)
delannoy(0, _, 1) :- !.
delannoy(_, 0, 1) :- !.
delannoy(M, N, D) :-
    M1 is M - 1, N1 is N - 1,
    delannoy(M1, N, A), delannoy(M, N1, B), delannoy(M1, N1, C),
    D is A + B + C.

main :- findall(D, (between(0, 5, N), delannoy(N, N, D)), L), write(L), nl.
% [1,3,13,63,321,1683]
:- initialization(main).
