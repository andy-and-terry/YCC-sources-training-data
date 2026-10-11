% Gnome sort over a list: walk a zipper, stepping back after each swap.
gnome_sort(List, Sorted) :- gnome([], List, Sorted).

gnome(Done, [], Done).
gnome([], [X|Xs], Sorted) :- gnome([X], Xs, Sorted).
gnome([P|Ps], [X|Xs], Sorted) :-
    (   P =< X
    ->  gnome([X,P|Ps], Xs, Sorted)
    ;   gnome(Ps, [X,P|Xs], Sorted)
    ).

% Done is kept in reverse order, so reverse it at the end.
sort_list(L, S) :- gnome_rev([], L, R), reverse(R, S).
gnome_rev(Done, [], Done).
gnome_rev([], [X|Xs], S) :- gnome_rev([X], Xs, S).
gnome_rev([P|Ps], [X|Xs], S) :-
    (   P =< X
    ->  gnome_rev([X,P|Ps], Xs, S)
    ;   gnome_rev(Ps, [X,P|Xs], S)
    ).

:- sort_list([5, 2, 9, 1, 5, 6], S), writeln(S).
:- sort_list([], S), writeln(S).
