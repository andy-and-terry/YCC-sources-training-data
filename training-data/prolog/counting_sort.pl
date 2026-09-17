counting_sort(List, Sorted) :-
    max_list(List, Max),
    findall(Count-Value,
        ( between(0, Max, Value),
          aggregate_all(count, member(Value, List), Count)
        ),
        Counts),
    expand(Counts, Sorted).

expand([], []).
expand([Count-Value|Rest], Result) :-
    findall(Value, between(1, Count, _), Repeated),
    expand(Rest, RestResult),
    append(Repeated, RestResult, Result).

:- counting_sort([4, 2, 2, 8, 3, 3, 1], Sorted), writeln(Sorted).
