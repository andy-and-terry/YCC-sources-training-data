% Removing and comparing list elements.
:- use_module(library(lists)).

:- delete([a, b, a, c], a, L), write(L), nl.
:- subtract([1, 2, 3, 4], [2, 4], L), write(L), nl.
:- intersection([1, 2, 3], [2, 3, 4], L), write(L), nl.
:- union([1, 2], [2, 3], L), write(L), nl.
:- exclude([X]>>(X > 2), [1, 2, 3, 4], L), write(L), nl.
:- list_to_set([a, b, a, c, b], S), write(S), nl.
:- select(b, [a, b, c], Rest), write(Rest), nl.
:- selectchk(a, [a, b, a], Rest), write(Rest), nl.
:- sumlist([1, 2], S), write(S), nl.
:- memberchk(c, [a, b, c]), write(found), nl.
