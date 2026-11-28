insert_tail(X, [], [X]).
insert_tail(X, [T|Ts], [X|Ts]) :- T >= X, !.
insert_tail(X, [T|Ts], [T|Rs]) :- insert_tail(X, Ts, Rs).

lis_tails([], Tails, Tails).
lis_tails([X|Xs], Acc, Tails) :- insert_tail(X, Acc, Acc1), lis_tails(Xs, Acc1, Tails).

:- lis_tails([10, 9, 2, 5, 3, 7, 101, 18], [], T), length(T, L), writeln(L).
