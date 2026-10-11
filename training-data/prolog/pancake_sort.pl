% Pancake sort: flip the largest unsorted element to the front, then to its place.
flip(K, List, Flipped) :-
    length(Prefix, K),
    append(Prefix, Rest, List),
    reverse(Prefix, RevPrefix),
    append(RevPrefix, Rest, Flipped).

pancake_sort(List, Sorted) :-
    length(List, N),
    pancake(N, List, Sorted).

pancake(N, List, List) :- N =< 1, !.
pancake(N, List, Sorted) :-
    length(Unsorted, N),
    append(Unsorted, Tail, List),
    max_list(Unsorted, Max),
    nth1(Pos, Unsorted, Max), !,
    flip(Pos, Unsorted, F1),
    flip(N, F1, F2),
    append(F2, Tail, Next),
    N1 is N - 1,
    pancake(N1, Next, Sorted).

:- pancake_sort([3, 6, 1, 9, 4, 2], S), writeln(S).
