knapsack([], _, 0).
knapsack([(Weight, Value)|Rest], Capacity, Result) :-
    Weight > Capacity, !,
    knapsack(Rest, Capacity, Result).
knapsack([(Weight, Value)|Rest], Capacity, Result) :-
    Capacity1 is Capacity - Weight,
    knapsack(Rest, Capacity1, WithResult),
    WithItem is WithResult + Value,
    knapsack(Rest, Capacity, WithoutItem),
    Result is max(WithItem, WithoutItem).

:- knapsack([(2,3),(3,4),(4,5),(5,6)], 5, Result), writeln(Result).
