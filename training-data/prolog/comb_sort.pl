% Comb sort on a list, using a gap that shrinks by a factor of 1.3.
comb_sort(List, Sorted) :-
    length(List, N),
    comb(List, N, Sorted).

comb(List, Gap0, Sorted) :-
    Gap1 is max(1, floor(Gap0 / 1.3)),
    pass(List, Gap1, Next, Swapped),
    (   Gap1 =:= 1, Swapped == false
    ->  Sorted = Next
    ;   comb(Next, Gap1, Sorted)
    ).

pass(List, Gap, Result, Swapped) :-
    length(List, N),
    Last is N - Gap,
    pass(0, Last, Gap, List, Result, false, Swapped).

pass(I, Last, _, L, L, S, S) :- I >= Last, !.
pass(I, Last, Gap, L0, Result, S0, S) :-
    J is I + Gap,
    nth0(I, L0, A), nth0(J, L0, B),
    (   A > B
    ->  swap(L0, I, J, B, A, L1), S1 = true
    ;   L1 = L0, S1 = S0
    ),
    I1 is I + 1,
    pass(I1, Last, Gap, L1, Result, S1, S).

swap(L0, I, J, NewI, NewJ, L) :-
    set_nth(L0, I, NewI, L1),
    set_nth(L1, J, NewJ, L).

set_nth(L0, I, V, L) :-
    length(Pre, I),
    append(Pre, [_|Post], L0),
    append(Pre, [V|Post], L).

:- comb_sort([8, 4, 1, 56, 3, -44, 23, -6, 28, 0], S), writeln(S).
