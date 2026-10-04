:- initialization(main).

main :-
    L = [10, 20, 30, 40, 50],
    nth0(0, L, First), nth1(1, L, FirstToo),
    format("nth0(0)=~w nth1(1)=~w~n", [First, FirstToo]),
    last(L, Last), format("last=~w~n", [Last]),
    nth0(Idx, L, 30), format("index of 30 is ~w~n", [Idx]),
    nth1(3, L, X, Rest), format("removed ~w, rest=~w~n", [X, Rest]),
    nth0(1, WithInserted, new, [a, b, c]), format("inserted: ~w~n", [WithInserted]),
    sum_list(L, Sum), max_list(L, Max), min_list(L, Min),
    format("sum=~w max=~w min=~w~n", [Sum, Max, Min]),
    max_member(MM, [3, 1, 4, 1, 5]), format("max_member=~w~n", [MM]),
    length(L, Len), format("length=~w~n", [Len]),
    sumlist([1, 2, 3], S2), format("sumlist=~w~n", [S2]),
    numlist(1, 5, Nums), format("numlist=~w~n", [Nums]),
    exclude([N]>>(N mod 20 =:= 0), L, Odd), format("excluded=~w~n", [Odd]),
    partition([N]>>(N < 35), L, Small, Large), format("partition=~w ~w~n", [Small, Large]),
    sumlist(Small, SS), format("small sum=~w~n", [SS]),
    last_two(L, A, B), format("last two=~w ~w~n", [A, B]).

last_two([A, B], A, B) :- !.
last_two([_|T], A, B) :- last_two(T, A, B).
