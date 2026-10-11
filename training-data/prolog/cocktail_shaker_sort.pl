% Cocktail shaker sort: a forward bubble pass then a backward one, until stable.
pass([X,Y|T], [Y|R]) :- X > Y, !, pass([X|T], R).
pass([X,Y|T], [X|R]) :- !, pass([Y|T], R).
pass(L, L).

shaker(List, Sorted) :-
    pass(List, Fwd),
    reverse(Fwd, RevF),
    pass_desc(RevF, RevB),
    reverse(RevB, Back),
    (   Back == List
    ->  Sorted = Back
    ;   shaker(Back, Sorted)
    ).

% the backward pass runs over the reversed list and moves the smallest to its end
pass_desc([X,Y|T], [Y|R]) :- X < Y, !, pass_desc([X|T], R).
pass_desc([X,Y|T], [X|R]) :- !, pass_desc([Y|T], R).
pass_desc(L, L).

:- shaker([5, 1, 4, 2, 8, 0, 2], S), writeln(S).
:- shaker([], S), writeln(S).
