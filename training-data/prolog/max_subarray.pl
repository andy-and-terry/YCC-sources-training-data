kadane([H|T], Best) :-
    kadane_helper(T, H, H, Best).

kadane_helper([], _, Best, Best).
kadane_helper([H|T], Current, Best, Result) :-
    NewCurrent is max(H, Current + H),
    NewBest is max(Best, NewCurrent),
    kadane_helper(T, NewCurrent, NewBest, Result).

:- kadane([-2,1,-3,4,-1,2,1,-5,4], Best), writeln(Best).
