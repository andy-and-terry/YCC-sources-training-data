% Cocktail shaker sort: alternate forward and backward bubbling passes.
bubble_forward([X,Y|T], [Y|R], true) :- X > Y, !, bubble_forward([X|T], R, _).
bubble_forward([X,Y|T], [X|R], S) :- !, bubble_forward([Y|T], R, S0), S = S0.
bubble_forward(L, L, false).

bubble_forward_flag([X], [X], false) :- !.
bubble_forward_flag([], [], false) :- !.
bubble_forward_flag([X,Y|T], [Lo|R], Swapped) :-
    (   X > Y -> Lo = Y, Hi = X, Swapped = true
    ;   Lo = X, Hi = Y, Swapped = S0
    ),
    bubble_forward_flag([Hi|T], R, S1),
    (   Swapped == true -> true ; Swapped = S0, S0 = S1 ).

shaker(List, Sorted) :-
    bubble_forward_flag(List, L1, S1),
    reverse(L1, R1),
    bubble_back(R1, R2, S2),
    reverse(R2, L2),
    (   S1 == false, S2 == false
    ->  Sorted = L2
    ;   shaker(L2, Sorted)
    ).

% backward pass works on the reversed list, pushing the minimum to the end
bubble_back([X], [X], false) :- !.
bubble_back([], [], false) :- !.
bubble_back([X,Y|T], [Hi|R], Swapped) :-
    (   X < Y -> Hi = Y, Lo = X, Swapped = true
    ;   Hi = X, Lo = Y, Swapped = S0
    ),
    bubble_back([Lo|T], R, S1),
    (   Swapped == true -> true ; Swapped = S0, S0 = S1 ).

:- shaker([5, 1, 4, 2, 8, 0, 2], S), writeln(S).
