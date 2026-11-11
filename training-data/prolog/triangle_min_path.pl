% Bottom-up: fold each row with the best-path costs of the row below it.
minimum_total(Rows, Best) :-
    reverse(Rows, [Bottom|Rest]),
    foldl(step, Rest, Bottom, [Best]).

step(Row, Below, New) :- step_(Row, Below, New).
step_([], _, []).
step_([V|Vs], [L,R|Rest], [X|Xs]) :-
    X is V + min(L, R),
    step_(Vs, [R|Rest], Xs).

:- minimum_total([[2], [3,4], [6,5,7], [4,1,8,3]], B), format("~w~n", [B]).  % 11
