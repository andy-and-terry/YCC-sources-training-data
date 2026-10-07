hanoi(0, _, _, _, []) :- !.
hanoi(N, From, To, Via, Moves) :-
    N > 0,
    N1 is N - 1,
    hanoi(N1, From, Via, To, MovesA),
    hanoi(N1, Via, To, From, MovesB),
    append(MovesA, [move(From, To) | MovesB], Moves).

:- hanoi(3, left, right, middle, Moves),
   forall(member(move(F, T), Moves), format("~w -> ~w~n", [F, T])),
   length(Moves, Count),
   format("total moves: ~w~n", [Count]).
