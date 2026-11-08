delta_encode([X|Xs], [X|Ds]) :- deltas([X|Xs], Ds).
deltas([_], []) :- !.
deltas([A,B|T], [D|Ds]) :- D is B - A, deltas([B|T], Ds).

delta_decode(Ds, Xs) :- scan(Ds, 0, Xs).
scan([], _, []).
scan([D|Ds], Acc, [V|Vs]) :- V is Acc + D, scan(Ds, V, Vs).

:- delta_encode([10,12,15,15,20], D), writeln(D), delta_decode(D, X), writeln(X).
