toeplitz([]).
toeplitz([_]).
toeplitz([Prev, Cur | Rest]) :-
    Cur = [_ | CurTail],
    length(CurTail, N),
    length(Prefix, N),
    append(Prefix, _, Prev),
    CurTail == Prefix,
    toeplitz([Cur | Rest]).

:- ( toeplitz([[1,2,3],[4,1,2],[5,4,1]]) -> writeln(true) ; writeln(false) ).
:- ( toeplitz([[1,2],[2,2]]) -> writeln(true) ; writeln(false) ).
