% Bead (gravity) sort.
count_ge(L, N, C) :- include([X]>>(X >= N), L, Ys), length(Ys, C).
bead_sort(Nums, Sorted) :-
    max_list(Nums, Max), length(Nums, Len),
    numlist(1, Max, Is), maplist([I, C]>>count_ge(Nums, I, C), Is, Cols),
    numlist(1, Len, Rs), maplist([R, C]>>count_ge(Cols, R, C), Rs, Rows),
    reverse(Rows, Sorted).
:- bead_sort([5, 3, 1, 4, 2], S), print(S), nl.
