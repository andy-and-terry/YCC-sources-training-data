% plus_one(+Digits, -Result): increment a base-10 number held as a digit list.
plus_one(Digits, Result) :-
    reverse(Digits, Rev),
    carry(Rev, 1, Out),
    reverse(Out, Result).

carry([], 0, []) :- !.
carry([], 1, [1]).
carry([D|T], C, [R|Out]) :-
    S is D + C, R is S mod 10, C1 is S // 10,
    carry(T, C1, Out).

:- plus_one([1, 2, 9], R), format("~w~n", [R]).  % [1,3,0]
:- plus_one([9, 9], R), format("~w~n", [R]).     % [1,0,0]
