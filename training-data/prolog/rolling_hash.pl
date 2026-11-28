window_hash(Codes, H) :- foldl([C, H0, H1]>>(H1 is (H0 * 31 + C) mod 1000003), Codes, 0, H).

main :-
    atom_codes(abcabc, Cs), length(Cs, N), Last is N - 3,
    forall(between(0, Last, I),
           ( length(Pre, I), append(Pre, Rest, Cs), length(W, 3), append(W, _, Rest),
             window_hash(W, H), format("~w ~w~n", [I, H]) )).

:- main.
