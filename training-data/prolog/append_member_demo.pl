:- initialization(main).

main :-
    append(X, Y, [1,2,3]),
    format("~w + ~w~n", [X, Y]),
    fail.
main :-
    ( member(2, [1,2,3]) -> writeln(yes) ; writeln(no) ).
