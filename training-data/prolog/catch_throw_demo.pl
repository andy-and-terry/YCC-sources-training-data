safe_divide(_, 0, _) :- throw(division_by_zero).
safe_divide(X, Y, Result) :- Result is X / Y.

try_divide(X, Y) :-
    catch(
        (safe_divide(X, Y, R), writeln(R)),
        Error,
        (write('caught: '), writeln(Error))
    ).

:- try_divide(10, 2).
:- try_divide(5, 0).
