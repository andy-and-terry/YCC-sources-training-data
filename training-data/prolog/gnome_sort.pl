% Gnome sort with a zipper: Done holds the sorted prefix in reverse order.
% When the next element is smaller than the head of Done, step back.
gnome_sort(List, Sorted) :-
    gnome([], List, Rev),
    reverse(Rev, Sorted).

gnome(Done, [], Done).
gnome([], [X|Xs], Sorted) :- gnome([X], Xs, Sorted).
gnome([P|Ps], [X|Xs], Sorted) :-
    (   P =< X
    ->  gnome([X,P|Ps], Xs, Sorted)
    ;   gnome(Ps, [X,P|Xs], Sorted)
    ).

:- gnome_sort([5, 2, 9, 1, 5, 6], S), writeln(S).
:- gnome_sort([], S), writeln(S).
