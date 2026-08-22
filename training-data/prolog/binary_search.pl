binary_search(List, Target, Index) :-
    length(List, Len),
    binary_search(List, Target, 0, Len, Index).

binary_search(_, _, Low, High, -1) :- Low >= High, !.
binary_search(List, Target, Low, High, Index) :-
    Mid is (Low + High) // 2,
    nth0(Mid, List, Value),
    (   Value =:= Target
    ->  Index = Mid
    ;   Value < Target
    ->  Low1 is Mid + 1,
        binary_search(List, Target, Low1, High, Index)
    ;   binary_search(List, Target, Low, Mid, Index)
    ).

:- binary_search([1,3,5,7,9,11,13], 7, Idx1), writeln(Idx1).
:- binary_search([1,3,5,7,9,11,13], 4, Idx2), writeln(Idx2).
