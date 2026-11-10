prime(N) :- N >= 2, \+ (between(2, N, D), D * D =< N, N mod D =:= 0).

main :-
    findall(P-Q, (between(3, 78, P), Q is P + 2, prime(P), prime(Q)), Pairs),
    write(Pairs), nl.
% [3-5,5-7,11-13,17-19,29-31,41-43,59-61,71-73]
:- initialization(main).
