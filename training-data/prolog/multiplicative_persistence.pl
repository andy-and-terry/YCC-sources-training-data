:- initialization(main).

digit_product(N, P) :-
    number_codes(N, Cs),
    foldl([C, A, A1]>>(A1 is A * (C - 0'0)), Cs, 1, P).

persistence(N, 0) :- N < 10, !.
persistence(N, S) :- digit_product(N, P), persistence(P, S0), S is S0 + 1.

main :-
    forall(member(N, [39, 77, 999, 10]),
           ( persistence(N, S), format("~w ~w~n", [N, S]) )).
