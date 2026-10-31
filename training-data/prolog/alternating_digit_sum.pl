:- initialization(main).

alternating_digit_sum(N, S) :- ads(N, 1, 0, S).

ads(0, _, Acc, Acc) :- !.
ads(N, Sign, Acc, S) :-
    D is N mod 10,
    Acc1 is Acc + Sign * D,
    Sign1 is -Sign,
    N1 is N // 10,
    ads(N1, Sign1, Acc1, S).

main :-
    forall(member(N, [1234, 99999, 1000]),
           ( alternating_digit_sum(N, S), format("~w ~w~n", [N, S]) )).
