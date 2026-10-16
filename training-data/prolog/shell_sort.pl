% Shell sort: gapped insertion sort over decreasing gaps.
shell_sort(List, Sorted) :-
    length(List, N),
    Gap is N // 2,
    shell(List, Gap, Sorted).

shell(List, 0, List) :- !.
shell(List, Gap, Sorted) :-
    gapped_insertion(List, Gap, Next),
    NewGap is Gap // 2,
    shell(Next, NewGap, Sorted).

gapped_insertion(List, Gap, Sorted) :-
    length(List, N),
    foldl(insert_at(Gap), [Gap-N], List, Sorted0),
    Sorted = Sorted0.

insert_at(Gap, Start-N, L0, L) :-
    Last is N - 1,
    numlist(Start, Last, Indexes),
    foldl(sift(Gap), Indexes, L0, L).

sift(Gap, I, L0, L) :-
    nth0(I, L0, V),
    sift_back(Gap, I, V, L0, L).

sift_back(Gap, J, V, L0, L) :-
    J >= Gap,
    K is J - Gap,
    nth0(K, L0, Prev),
    Prev > V, !,
    set_nth(L0, J, Prev, L1),
    sift_back(Gap, K, V, L1, L).
sift_back(_, J, V, L0, L) :- set_nth(L0, J, V, L).

set_nth(L0, I, V, L) :-
    length(Pre, I),
    append(Pre, [_|Post], L0),
    append(Pre, [V|Post], L).

:- shell_sort([23, 4, 42, 15, 8, 16, 1], S), writeln(S).
