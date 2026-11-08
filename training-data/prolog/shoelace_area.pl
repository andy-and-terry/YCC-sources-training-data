cross([X1,Y1], [X2,Y2], V) :- V is X1*Y2 - X2*Y1.

area(Pts, A) :-
    Pts = [First|Rest],
    append(Rest, [First], Next),
    maplist(cross, Pts, Next, Vs),
    sum_list(Vs, S),
    A is abs(S) / 2.

:- area([[0,0],[4,0],[4,3],[0,3]], A), writeln(A).
