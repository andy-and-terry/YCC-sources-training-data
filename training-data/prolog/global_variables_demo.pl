% nb_setval/b_setval keep global state outside of normal unification.
:- nb_setval(counter, 0).

increment :-
    nb_getval(counter, C0),
    C is C0 + 1,
    nb_setval(counter, C).

:- forall(between(1, 5, _), increment),
   nb_getval(counter, V),
   format("counter after loop: ~w~n", [V]).

% b_setval is undone on backtracking.
:- b_setval(tmp, 1),
   (   b_setval(tmp, 2), fail
   ;   b_getval(tmp, T), format("tmp after backtrack: ~w~n", [T])
   ).
