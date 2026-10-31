:- initialization(main).

fact(0, 1) :- !.
fact(N, F) :- N1 is N - 1, fact(N1, F1), F is N * F1.

factorion(N) :-
    number_codes(N, Cs),
    foldl([C, A, A1]>>(D is C - 0'0, fact(D, F), A1 is A + F), Cs, 0, Sum),
    Sum =:= N.

main :-
    findall(N, (between(1, 49999, N), factorion(N)), Ns),
    print(Ns), nl.
