binary_search(Arr, Low, High, Target, Index) :-
    Low =< High,
    Mid is (Low + High) // 2,
    nth0(Mid, Arr, Val),
    ( Val =:= Target -> Index = Mid
    ; Val < Target -> Low1 is Mid + 1, binary_search(Arr, Low1, High, Target, Index)
    ; High1 is Mid - 1, binary_search(Arr, Low, High1, Target, Index)
    ).

:- length(Arr, 6), Arr = [1,3,5,7,9,11],
   ( binary_search(Arr, 0, 5, 7, Idx) -> writeln(Idx) ; writeln(-1) ).
