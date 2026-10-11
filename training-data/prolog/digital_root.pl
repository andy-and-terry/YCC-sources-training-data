digit_sum(0, 0) :- !.
digit_sum(N, S) :-
    D is N mod 10,
    R is N // 10,
    digit_sum(R, S0),
    S is S0 + D.

digital_root(N, N) :- N < 10, !.
digital_root(N, Root) :-
    digit_sum(N, S),
    digital_root(S, Root).

:- forall(member(N, [942, 132189, 493193]),
          ( digital_root(N, R), format("~w -> ~w~n", [N, R]) )).
