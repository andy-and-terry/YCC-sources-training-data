second_largest(List, Second) :-
    sort(0, @>=, List, Desc),     % sort descending, removing duplicates
    Desc = [_, Second | _].

:- second_largest([4, 9, 2, 9, 7], S), writeln(S).
:- ( second_largest([3, 3], S) -> writeln(S) ; writeln(none) ).
