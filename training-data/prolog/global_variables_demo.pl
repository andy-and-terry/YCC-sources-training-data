% nb_setval/nb_getval keep values across backtracking;
% b_setval/b_getval are undone when execution backtracks.
:- initialization(main).

main :-
    nb_setval(counter, 0),
    forall(member(_, [a, b, c, d]), increment),
    nb_getval(counter, Total),
    format("counter after forall: ~w~n", [Total]),

    b_setval(tmp, 1),
    ( b_setval(tmp, 2), fail ; true ),
    b_getval(tmp, T),
    format("b_setval undone by backtracking: ~w~n", [T]),

    nb_setval(items, []),
    forall(between(1, 5, I),
           ( nb_getval(items, Old), Sq is I * I, nb_setval(items, [Sq|Old]) )),
    nb_getval(items, Items),
    reverse(Items, Ordered),
    format("collected: ~w~n", [Ordered]).

increment :-
    nb_getval(counter, C0),
    C is C0 + 1,
    nb_setval(counter, C).
