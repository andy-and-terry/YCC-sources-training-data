two_sum(Nums, Target, I, J) :-
    nth0(I, Nums, A),
    nth0(J, Nums, B),
    I < J,
    A + B =:= Target, !.

:- two_sum([2,7,11,15], 9, I, J), format("~w ~w~n", [I, J]).
